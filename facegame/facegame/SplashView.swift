//
//  SplashView.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/15.
//

import SwiftUI

//アプリを立ち上げた時の画面
struct SplashView: View {
    var body: some View {
        ZStack{
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .offset(x: -25)
        }
    }
}

#Preview {
    SplashView()
        .environmentObject(ViewRouter())
}

