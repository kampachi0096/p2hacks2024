//
//  Game.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/15.
//

import SwiftUI
import UIKit

// ボタンのデザインと動作を統合したビュー
struct BackButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .foregroundColor(Color(red: 0.85, green: 0.69, blue: 1.0))
                .frame(width: 60, height: 60)
                .background(Color(red: 0.39, green: 0.24, blue: 0.53))
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color(red: 0.85, green: 0.69, blue: 1.0), lineWidth: 4)
                )
                .shadow(color: Color(red: 0.85, green: 0.69, blue: 1.0).opacity(0.8), radius: 10, x: 0, y: 0)
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct GameView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()

            Text("Game Screen")
                .font(.largeTitle)
                .foregroundColor(.white)

            VStack {
                Spacer()
                HStack {
                    BackButton(title: "←") {
                        viewRouter.currentPage = .home // HomeViewに戻る
                    }
                    .frame(width: 60, height: 60) // ボタンのサイズ
                    .padding(.leading, 20)
                    .padding(.bottom, 20)
                    
                    Spacer()
                }
            }
        }
    }
}

// プレビュー用
#Preview {
    GameView()
        .environmentObject(ViewRouter())
}
