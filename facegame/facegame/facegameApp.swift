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
    
    init() {
        configureAudioSession()
        AudioPlayer.shared.playSound(fileName: "n003", fileExtension: "mp3") // 音声再生を開始
    }
    
    var body: some Scene {
        WindowGroup {
            if viewRouter.currentPage == .splash {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            viewRouter.currentPage = .home
                        }
                    }
            } else {
                HomeView()
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background || newPhase == .inactive {
                AudioPlayer.shared.stopSound() // アプリがバックグラウンドまたは終了時に音楽を停止
            }
        }
    }
    
    @Environment(\.scenePhase) private var scenePhase

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

// ページを表す列挙型
enum Page {
    case splash
    case home
}
