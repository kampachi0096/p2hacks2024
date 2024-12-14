//
//  Screen1.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

// 画面1
struct Screen1: View {
    var body: some View {
        VStack {
            Text("ARで写真撮る")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        .navigationTitle("AR写真")
    }
}

// プレビュー用
struct screen1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
