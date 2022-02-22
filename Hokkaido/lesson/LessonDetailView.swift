//
//  LessonDetailView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonDetailView: View {
    let lxk : LessonXKanji
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(lxk.kanji) { k in
                        IconView(symbol: k.symbol, label: k.name).frame(width: 75, height: 75).clipped()
                    }
                }
            }
        }.navigationTitle(lxk.lesson.name)
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetailView(lxk: HkDebug.LoadTestData(name: "Lesson 1", symbol: "目")).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
