//
//  Screen2.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

// 画面2
struct Screen2: View {
    var body: some View {
        VStack {
            Text("図鑑")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
        .navigationTitle("図鑑")
    }
}

// プレビュー用
struct screen2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
