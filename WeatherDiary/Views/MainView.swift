import SwiftUI

struct MainView: View {
    @ObservedObject var weatherManager: WeatherManager = WeatherManager()
    
    var body: some View {
        
        VStack {
            if let currentWeather = weatherManager.currentWeather {
//                HStack {
//                    Button(action: {
//
//                    }) {
//                        Image(systemName: "text.justify")
//                            .foregroundColor(.black)
//                            .font(.title)
//                            .padding()
//                    }
//                    Spacer()
//                }
                CurrentWeatherView(currentWeather: currentWeather)
                HourlyWeatherCardListView(hourlyWeathers: weatherManager.infos)
                WeeklyWeatherListView(weeklyInfo: weatherManager.weeklyWeathers)
            } else {
                ContentView()
                    .task {
                        do {
                            try await weatherManager.requestWeather(grid: Grid(nx: 102, ny: 94))
                            // FIXME: API 호출 에러 수정 필요
                            try await weatherManager.fetchWeeklyWeather(weatherRegId: "11B00000", temperatureRegId: "11B10101")
                        } catch {
                            print("에러")
                        }
                    }
            }
            Spacer()
        }.background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        
    }
}

