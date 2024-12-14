//
//  Audio.swift
//  facegame
//
//  Created by kantayamamoto   on 2024/12/15.
//
import AVFoundation

class AudioPlayer {
    static let shared = AudioPlayer()
    private var player: AVAudioPlayer?

    private init() {}

    func playSound(fileName: String, fileExtension: String) {
        // デバッグ
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("音声ファイルが見つかりません")
            return
        }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1 // ループ再生
            player?.play()
        } catch {
            print("音声再生エラー: \(error.localizedDescription)")
        }
    }

    func stopSound() {
        player?.stop()
        player = nil
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setActive(false, options: .notifyOthersOnDeactivation) // セッションを無効化
        } catch {
            print("AVAudioSessionの無効化に失敗しました: \(error)")
        }
    }
}
