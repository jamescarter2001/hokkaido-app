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
            KanjiIconView(kanji: lessonXKanji.kanji[0].symbol, label: "")
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

func LoadTestData(name: String, symbol: String) -> LessonXKanji {
    let testKanji : Kanji = Kanji(id: 1, symbol: symbol, name: "Hello", onReadings: [], kunReadings: [], meanings: [])
    
    let testKanji2 : Kanji = Kanji(id: 1, symbol: "目", name: "Hello", onReadings: [], kunReadings: [], meanings: [])
    
    
    let testLesson : Lesson = Lesson(id: 1, name: name, isDefault: true)
    
    let lessonXKanji : LessonXKanji = LessonXKanji(lesson: testLesson, kanji: [testKanji, testKanji2])
    
    return lessonXKanji
}

struct LessonListItemView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListItemView(lessonXKanji: LoadTestData(name: "Lesson 1", symbol: "目")).previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
