//
//  KanjiIconView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct IconView: View {
    let symbol : String
    let label : String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(symbol).font(.system(size: 40))
            if (label != "") {
                Text(label)
            }
        }
    }
}

struct KanjiIconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(symbol: "木", label: "Hello").previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
