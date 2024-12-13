//
//  Untitled.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

// ホーム画面
struct HomeView: View {
    var body: some View {
        VStack {
            Text("ホーム画面")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
//            Rectangle()
//                .foregroundColor(.black)
//                .frame(width: 300, height: 1)
//                .padding(.top, 100) // 上方向に50ポイントの余白を追加
            
            .navigationTitle("ホーム画面")
        }
    }
}

// プレビュー用
struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
