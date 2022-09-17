import SwiftUI

struct MainView: View {
    @ObservedObject var weatherManager: WeatherManager = WeatherManager()
    @State var showingSheet: Bool = false
    
    var body: some View {
        
        VStack {
            if let currentWeather = weatherManager.currentWeather {
                CurrentWeatherView(currentWeather: currentWeather)
                HourlyWeatherCardListView(hourlyWeathers: weatherManager.infos)
                WeeklyWeatherListView(weeklyInfo: weatherManager.weeklyWeathers)
                Spacer()
                Button(action: {
                    showingSheet.toggle()
                }, label: {
                    Text("라이센스")
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                })
            } else {
                ContentView()
                    .task {
                        do {
                            try await weatherManager.requestWeather(grid: Grid(nx: 102, ny: 94))
                        } catch {
                            print("에러1")
                            do {
                                try await weatherManager.requestWeather(grid: Grid(nx: 102, ny: 94))
                            } catch {
                                print("에러2")
                                do {
                                    try await weatherManager.requestWeather(grid: Grid(nx: 102, ny: 94))
                                } catch {
                                    print("에러3")
                                }
                            }
                        }
                    }
            }
        }.background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        .sheet(isPresented: $showingSheet) {
            LicenseView()
        }
        
    }
}



