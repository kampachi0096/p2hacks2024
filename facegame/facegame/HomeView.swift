//
//  Untitled.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI
import UIKit

class GlowingButton: UIButton {
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

struct GlowingButtonRepresentable: UIViewRepresentable {
    let title: String
    let action: () -> Void

    func makeUIView(context: Context) -> UIButton {
        let button = GlowingButton()
        button.setTitle(title, for: .normal)
        button.addAction(UIAction { _ in action() }, for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {}
}

struct HomeView: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        ZStack {
            Image("home")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .offset(x: -25)

            VStack {
                Spacer()
                GlowingButtonRepresentable(title: "PLAY!") {
                    viewRouter.currentPage = .game // ボタン押下時にGame画面へ遷移
                }
                .frame(width: 200, height: 60)
                .padding(.bottom, 170)
            }
        }
    }
}

// プレビュー
#Preview {
    HomeView()
        .environmentObject(ViewRouter()) 
}
