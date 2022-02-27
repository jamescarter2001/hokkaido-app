//
//  KanjiDetailView.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import SwiftUI

struct KanjiDetailView: View {
    let kanji : Kanji
    var body: some View {
        List {
            Section {
                HStack {
                    IconView(size: 60, number: "", symbol: kanji.symbol, label: "").padding(.trailing)
                    VStack(alignment: .leading) {
                        //Text(kanji.name).font(.headline)
                        Text(kanji.meanings.joined(separator: ", ")).foregroundColor(.gray)
                    }
                    Spacer()
                }.listRowBackground(Color.clear).listRowSeparatorTint(Color.clear)                        .padding(.bottom, 12)
                TitledCellView(title: "On-Yomi", content: kanji.onReadings.joined(separator: " • "))
                TitledCellView(title: "Kun-Yomi", content: kanji.kunReadings.joined(separator: " • "))
            }
        }.listStyle(.grouped)
    }
}

struct KanjiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiDetailView(kanji: HkDebug.DummyKanji1()).preferredColorScheme(.dark)
    }
}
