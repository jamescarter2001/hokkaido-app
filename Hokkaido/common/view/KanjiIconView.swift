//
//  KanjiIconView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct KanjiIconView: View {
    let kanji : String
    let label : String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(kanji).font(.system(size: 45))
            if (label != "") {
                Text(label)
            }
        }.frame(width: 75, height: 75).clipped()
    }
}

struct KanjiIconView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiIconView(kanji: "木", label: "Hello").previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
