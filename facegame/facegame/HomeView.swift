//
//  Untitled.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("ホーム画面")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationTitle("ホーム画面")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
