//
//  KanjiListView.swift
//  Hokkaido
//
//  Created by James on 22/02/2022.
//

import SwiftUI

struct KanjiListView: View {
    let kanji : [Kanji]
    let searchText : String
    
    var body: some View {
        List(kanji) { k in
            ZStack(alignment: .leading) {
                HStack() {
                    IconView(size: 35, number: "", symbol: k.symbol, label: "").padding()
                    Text(String(k.id)).foregroundColor(.gray)
                    VStack(alignment: .leading) {
                        HStack {
                            Text(k.name).bold()
                            Text(k.onReadings.joined(separator: " • ")).font(.subheadline).foregroundColor(.blue)
                            if (!k.onReadings.isEmpty && !k.kunReadings.isEmpty) {
                                Text("•").bold()
                            }
                            Text(k.kunReadings.joined(separator: " • ")).font(.subheadline).foregroundColor(.red)
                        }
                        Text(k.meanings.joined(separator: ", ")).foregroundColor(.gray)
                    }.padding()
                }
                NavigationLink(destination: KanjiDetailView(kanji: k).navigationTitle(k.name)) {
                    EmptyView()
                }.opacity(0)
            }
        }.listStyle(.plain).id(UUID())
    }
}

struct KanjiListView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiListView(kanji: [Kanji(id: 1111, symbol: "A", name: "Test", onReadings: ["aaa"], kunReadings: ["bbb"], meanings: ["ccc", "dddd", "eeee"])], searchText: "").preferredColorScheme(.dark)
    }
}
