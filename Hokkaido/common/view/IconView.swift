//
//  KanjiIconView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct IconView: View {
    let size : CGFloat
    let number : String
    let symbol : String
    let label : String
    
    var body: some View {
        VStack(spacing: 0) {
            if (number != "") {
                Text(number).foregroundColor(.gray)
            }
            Text(symbol).font(.system(size: size))
            if (label != "") {
                Text(label).multilineTextAlignment(.center)
            }
        }
    }
}

struct KanjiIconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(size: 35, number: "1", symbol: "木", label: "Hello").previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}
