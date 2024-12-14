//
//  Screen1.swift
//  facegame
//
//  Created by 小西陽輝 on 2024/12/13.
//

import SwiftUI

struct Screen1View: View {
    var body: some View {
        VStack {
            Text("ARで写真撮る")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
        .navigationTitle("AR写真")
    }
}

struct Screen1View_Previews: PreviewProvider {
    static var previews: some View {
        Screen1View()
    }
}
