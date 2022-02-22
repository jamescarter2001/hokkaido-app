//
//  LessonListItemView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct LessonListItemView: View {
    let lessonXKanji : LessonXKanji
    
    var body: some View {
        HStack {
            IconView(symbol: lessonXKanji.kanji.first?.symbol ?? "", label: "").frame(width: 75, height: 75)
            VStack(alignment: .leading) {
                Text(lessonXKanji.lesson.name)
                Text(GenerateKanjiString(kanji:lessonXKanji.kanji)).foregroundColor(.gray)
            }
        }
    }
}

func GenerateKanjiString(kanji: [Kanji]) -> String {
    let symbols : [String] = kanji.map {String($0.symbol)}
    
    return symbols.joined(separator: " ")
}

struct LessonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListItemView(lessonXKanji: HkDebug.LoadTestData(name: "Lesson 1", symbol: "目")).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
