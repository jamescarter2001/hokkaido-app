//
//  LessonDetailView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonDetailView: View {
    let lxk : LessonXKanji
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State var presentFlashcards = false
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(lxk.kanji) { k in
                    ZStack {
                        IconView(size: 35, number: String(k.id), symbol: k.symbol, label: k.name).frame(width: 70, height: 100).clipped()
                        NavigationLink(destination: KanjiDetailView(kanji: k).navigationTitle(k.name)) {
                            RoundedRectangle(cornerRadius: 5).accentColor(.gray).opacity(0.2)
                        }
                    }
                }
            }.padding(10).toolbar {
                NavigationLink(destination: FlashcardView(kanji: lxk.kanji, shuffled: true, closeCallback: onClosedButtonPressed).navigationBarTitleDisplayMode(.inline)) {
                    Text("Flashcards")
                }
            }
        }
    }
    
    private func onClosedButtonPressed() {
        self.presentFlashcards = false
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetailView(lxk: HkDebug.LoadTestData(name: "Lesson 1", symbol: "目")).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
