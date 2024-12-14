//
//  ContentView.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                // ホーム画面
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("ホーム")
                    }
                
                // 画面1 (ARカメラ)
                Screen1View()
                    .tabItem {
                        Image(systemName: "camera.fill")
                        Text("ARカメラ")
                    }
                
                // 図鑑（PhotographView）
                PhotographView()
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("図鑑")
                    }
            }
            .accentColor(.blue)
        }
    }
}

// プレビュー用
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
