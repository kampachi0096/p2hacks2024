//
//  Datail.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/14.
//

import SwiftUI

struct DatailView: View {
    var body: some View {
        VStack {
            Text("詳細ページ")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Text("ここに図鑑の詳細情報が表示されます。")
        }
        .navigationTitle("詳細")
    }
}

struct DatailView_Previews: PreviewProvider {
    static var previews: some View {
        DatailView()
    }
}
