//
//  Screen2.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

// 写真ビュー（最初のページ）
struct PhotographView: View {
    @State private var counter: Int = 0 // カウンター変数を追加
    @State private var navigateToNextView = false // 画面遷移の状態管理用
    
    var body: some View {
        NavigationStack {
            VStack {
              
                Spacer() // ボタンを下に押し出すためのスペーサー
                
                // プラスボタンのみ
                Button(action: {
                    counter += 1
                    // カウンターが一定の値に達したら遷移
                    if counter == 1 {
                        navigateToNextView = true
                    }
                }) {
                    Image(systemName: "plus.square")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .padding()
                }
                .background(
                    NavigationLink(
                        "",
                        destination: NextView(counter: counter)
                            .onDisappear { counter = 0 }, // 戻ったときにカウンターをリセット
                        isActive: $navigateToNextView
                    )
                    .hidden() // NavigationLinkは非表示
                )
            }
            .padding() // 全体に余白を追加
            .navigationTitle("１ページ目")
        }
    }
}

// 次の画面（遷移先）
struct NextView: View {
    @State var counter: Int // 前の画面からカウンター値を受け取る
    @State private var navigateToNextView = false // 次の画面遷移管理
    
    var body: some View {
        VStack {
            
            Spacer() // ボタンを下に押し出すためのスペーサー
            
            // プラスボタンのみ
            Button(action: {
                counter += 1
                // カウンターが一定の値に達したら遷移
                if counter == 1 { // 次の画面に進む条件
                    navigateToNextView = true
                }
            }) {
                Image(systemName: "plus.square")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            .background(
                NavigationLink(
                    "",
                    destination: FinalView(counter: counter)
                        .onDisappear { counter = 0 }, // 戻ったときにカウンターをリセット
                    isActive: $navigateToNextView
                )
                .hidden() // NavigationLinkは非表示
            )
            
            .padding() // 全体に余白を追加
            .navigationTitle("２ページ目")
            
        }
    }
}

// 最終画面（遷移先）
struct FinalView: View {
    var counter: Int // 前の画面からカウンター値を受け取る
    
    var body: some View {
        VStack {
        
            
            Spacer() // 必要に応じてスペースを追加
        }
        
        .padding() // 全体に余白を追加
        .navigationTitle("3ページ目")
        
    }
}

struct PhotographView_Previews: PreviewProvider {
    static var previews: some View {
        PhotographView()
    }
}

