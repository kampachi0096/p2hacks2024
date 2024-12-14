//
//  facegameApp.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/13.
//

import SwiftUI
import AVFoundation

@main
struct facegameApp: App {
    @StateObject private var viewRouter = ViewRouter()
    @Environment(\.scenePhase) private var scenePhase

    init() {
        configureAudioSession()
        AudioPlayer.shared.playSound(fileName: "n003", fileExtension: "mp3") // 起動時の音声再生
    }
    
    var body: some Scene {
        WindowGroup {
            switch viewRouter.currentPage {
            case .splash:
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewRouter.currentPage = .home
                        }
                    }
            case .home:
                HomeView()
                    .environmentObject(viewRouter)
            case .game:
                GameView()
                    .environmentObject(viewRouter)
            }
        }
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .background, .inactive:
                AudioPlayer.shared.stopSound()
            case .active:
                AudioPlayer.shared.playSound(fileName: "n003", fileExtension: "mp3")
            default:
                break
            }
        }
    }

    func configureAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback)
            try session.setActive(true)
        } catch {
            print("Audio session setup error: \(error)")
        }
    }
}

// ページ遷移管理クラス
class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .splash
}

enum Page {
    case splash
    case home
    case game
}
