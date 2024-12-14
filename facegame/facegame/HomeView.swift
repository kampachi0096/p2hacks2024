//
//  Untitled.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI
import UIKit

// UIKitのUIButtonを作成
class GlowingButton: UIButton {
    
    // ボタンの色定義
    private let glowColor = UIColor(red: 0.85, green: 0.69, blue: 1.0, alpha: 1)
    private let btnColor = UIColor(red: 0.39, green: 0.24, blue: 0.53, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        self.backgroundColor = btnColor
        self.setTitleColor(glowColor, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 4
        self.layer.borderColor = glowColor.cgColor
        
        self.layer.shadowColor = glowColor.cgColor
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.masksToBounds = false
        
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchDragExit])
    }
    
    @objc private func buttonPressed() {
        self.backgroundColor = glowColor
        self.setTitleColor(btnColor, for: .normal)
        self.layer.shadowRadius = 25
    }
    
    @objc private func buttonReleased() {
        self.backgroundColor = btnColor
        self.setTitleColor(glowColor, for: .normal)
        self.layer.shadowRadius = 15
    }
}

// UIKitのUIButtonをSwiftUIで使うためのUIViewRepresentable
struct GlowingButtonRepresentable: UIViewRepresentable {
    let title: String
    
    func makeUIView(context: Context) -> UIButton {
        let button = GlowingButton()
        button.setTitle(title, for: .normal)
        return button
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        // 必要に応じて更新ロジックを追加
    }
}

// SwiftUIのビュー
struct HomeView: View {
    var body: some View {
        ZStack {
            // 背景画像を中央に配置
            Image("home")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .offset(x: -25)
            
            // ボタンと他の要素を重ねる
            VStack {
                Spacer()
                GlowingButtonRepresentable(title: "PLAY!")
                    .frame(width: 200, height: 60)
                    .padding(.bottom, 170) // ボタン位置を画面下部に寄せる
            }
        }
    }
}

// プレビュー
#Preview {
    HomeView()
}
