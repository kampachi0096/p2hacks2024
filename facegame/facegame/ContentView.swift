//
//  ContentView.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/13.
//

import SwiftUI

// ボトムバー（タブバー）
struct ContentView: View {
    var body: some View {
        TabView {
                
                // ホーム画面
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("ホーム")
                    }
                
                // 画面1
                Screen1()
                    .tabItem {
                        Image(systemName: "camera.fill")
                        Text("ARカメラ")
                    }
                
                // 画面2
                Screen2()
                    .tabItem {
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("図鑑")
                    }
                
                
            }
            
            .accentColor(.blue) // タブバー選択時の色
            
        }
        
    }

// プレビュー用
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
