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
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(lxk.kanji) { k in
                        KanjiIconView(kanji: k.symbol, label: k.name)
                    }
                }
            }
        }
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetailView(lxk: LoadTestData(name: "Lesson 1", symbol: "目")).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
