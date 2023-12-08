//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by sam on 2022/9/2.
//

import SwiftUI


class Model: ObservableObject {
    init() { print("Model Created") }
    @Published var score: Int = 0
}

struct ScorePlate: View {

    @StateObject var model = Model()
    @State private var niceScore = false

    var body: some View {
        VStack {
            Button("+1") {
                model.score += 1
                if model.score > 3 {
                    niceScore = true
                }
            }
            Text("Score: \(model.score)")
            Text("Nice? \(niceScore ? "YES" : "NO")")
            ScoreText(model: model).padding(.top, 20)
        }
    }
}

struct ScoreText: View {
    @ObservedObject var model: Model

    var body: some View {
        if model.score > 10 {
            return Text("Fantastic")
        } else if model.score > 3 {
            return Text("Good")
        } else {
            return Text("Ummmm...")
        }
    }
}




struct ContentView: View {
    
    @State private var selection: Tab = .featured
    @State private var showRealName = false
    @State private var isPresented = false
    @State private var isDarkMode = false
    
    enum Tab {
        case featured
        case list
    }
    @State var backgroundColor = Color.clear
//    var body: some View {
//        print("Coming in")
////        return MimikkoDialog();
//        return VStack(alignment: HorizontalAlignment.center) {
//            Button("你好"){
//                backgroundColor = Color.red
//            }.buttonStyle(MimikkoButtonStyle.primary)
//                    Button("Toggle Name") {
//                        showRealName.toggle()
//                    }
//                    .padding(.bottom, 60)
//                    .sheet(isPresented: $isPresented) {
//                        List {
//                            Toggle("Dark Mode", isOn: $isDarkMode)
//                        }
//                        .preferredColorScheme(isDarkMode ? .dark : .light)
//                    }
//                    .buttonStyle(MimikkoButtonStyle.primary)
//                    Text("Current User: \(showRealName ? "Wei Wang" : "onevcat")")
//                    ScorePlate().padding(.top, 20)
//        }.preferredColorScheme(.dark).background(backgroundColor).animation(.easeIn(duration: 3), value: backgroundColor)
//    }

    
    var body: some View {
//        let theme = getTheme()
        TabView(selection: $selection) {
            CategoryHome()
                .environmentObject(ModelData())
                .tabItem {
                    Label("featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .environmentObject(ModelData())
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }

    }
}

struct NewView: View {
    @State private var age = 0
    var body: some View {
        VStack{
            Text("current age :\(age)").onTapGesture {
                age += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
struct DetailView1: View {
    @State private var number: Int?

    init(number: Int) {
        self.number = number + 1
    }

    var body: some View {
        HStack {
            Text("1: \(number ?? 0)")
            Button("+") { number = (number ?? 0) + 1 }
        }.onAppear() {
            number = 99
            print("onAppear")
        }
    }
}

