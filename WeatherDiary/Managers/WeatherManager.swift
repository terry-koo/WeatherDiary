//
//  WeatherManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//
import Foundation

class WeatherManager: ObservableObject {
    @Published var fin: Bool = false
    var currentWeather: CurrentWeather?
    var infos: [HourlyWeather] = []
    let date = DateManager()
    var today: String { date.getTodayDate() }
    var currentTime: String { date.getCategorizedTime() }
    var baseTime: String { date.getCategorizedHour() + "00" }
    
    // MARK: - API key
    private var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "key", ofType: "plist") else {
          fatalError("Couldn't find file 'Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "apiKey") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }
        return value
      }
    }
    
    // MARK: - json데이터 요청
    func requestWeather(grid: Grid) async throws -> Void {
        self.currentWeather = CurrentWeather()
        guard let url = URL.forHourlyWeather(date: today, baseTime: baseTime, grid: grid) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(Response.self, from: data)
        infos = self.fetchHourlyWeather(from: decoedData)
        self.currentTempCondition(decodedData: decoedData)
        try await self.lowestHighestTemp(grid: grid)
        // FIXME: - 스레드
        fin = true
    }

    // MARK: - 시간별 날씨 메서드
    private func fetchHourlyWeather(from decodedDate: Response) -> [HourlyWeather] {
        let hourlyItems = decodedDate.response.body.items.item
        var hourlyWeathers: [HourlyWeather] = []
        var condition: String = ""
        var temperature: String = ""
        var rainProbabillity: String = ""
        var sky: String = ""
        
        for item in hourlyItems {
            guard hourlyWeathers.count < 25 else { break }
            
            if (item.fcstDate == today && item.fcstTime >= currentTime) || item.fcstDate != today {
                switch item.category {
                case "POP": rainProbabillity = item.fcstValue
                case "TMP": temperature = item.fcstValue
                case "PTY": condition = item.fcstValue
                case "SKY": sky = item.fcstValue
                default: break
                }
                if condition != "" && temperature != "" && rainProbabillity != "" && sky != "" {
                    if item.fcstTime == currentTime {
                        hourlyWeathers.append(HourlyWeather(time: "지금", temperature: temperature + "°", rainProbabillity: rainProbabillity, condition: condition, sky: sky))
                    }
                    hourlyWeathers.append(HourlyWeather(time: item.fcstTime, temperature: temperature + "°", rainProbabillity: rainProbabillity, condition: condition, sky: sky))
                    condition = ""
                    temperature = ""
                    sky = ""
                    rainProbabillity = ""
                }
            }
        }
        return hourlyWeathers
    }
    
    // MARK: - 현재 기상 상태, 현재 온도 메서드
    private func currentTempCondition(decodedData: Response) -> Void {
        // MARK: - Condition: 현재 기상 상태
        for i in decodedData.response.body.items.item.filter({ ($0.fcstDate == today && $0.fcstTime == currentTime && $0.category == "POP") || ($0.fcstDate == today && $0.fcstTime == currentTime && $0.category == "PTY") || ($0.fcstDate == today && $0.fcstTime == currentTime && $0.category == "SKY") }){
            switch i.category {
            case "SKY":
                self.currentWeather?.sky = i.fcstValue
            case "PTY":
                self.currentWeather?.pty = i.fcstValue
            case "POP":
                self.currentWeather?.pop = i.fcstValue
            default:
                break
            }
        }
        // MARK: - TMP: 현재 기온
        for i in decodedData.response.body.items.item.filter({ $0.category == "TMP" && $0.fcstDate == today && Int($0.fcstTime)! >= Int(currentTime)!}) {
            self.currentWeather?.currentTemp = i.fcstValue
            break
        }
    }
    
    // MARK: - 일 최고/최저 기온 메서드
    private func lowestHighestTemp(grid: Grid) async throws -> Void {
            let dateManager: DateManager = DateManager()
            
        guard let url = URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(apiKey)&pageNo=1&numOfRows=290&dataType=JSON&base_date=\(dateManager.getTodayDate())&base_time=0200&nx=\(grid.nx)&ny=\(grid.ny)") else {
                fatalError("Missing URL")
            }
        
            let urlRequest = URLRequest(url: url)
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error fetching weather data")
            }
            
            let decodedData = try JSONDecoder().decode(Response.self, from: data)

            // MARK: - TMX: 일 최고 기온
            for i in decodedData.response.body.items.item.filter({ $0.category == "TMX" && $0.fcstDate == dateManager.getTodayDate() }) {
                currentWeather?.highestTemp = i.fcstValue
                break
            }

            // MARK: - TMN: 일 최저 기온
            for i in decodedData.response.body.items.item.filter({ $0.category == "TMN" && $0.fcstDate == dateManager.getTodayDate() }) {
                currentWeather?.lowestTemp = i.fcstValue
                break
            }
        }
}
