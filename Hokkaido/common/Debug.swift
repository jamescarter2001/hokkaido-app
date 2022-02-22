//
//  debug.swift
//  Hokkaido
//
//  Created by James on 22/02/2022.
//

import Foundation

class HkDebug {
    static func LoadTestData(name: String, symbol: String) -> LessonXKanji {
        let testKanji : Kanji = Kanji(id: 1, symbol: symbol, name: "Test", onReadings: [], kunReadings: [], meanings: [])
        
        let testKanji2 : Kanji = Kanji(id: 1, symbol: "目", name: "Hello", onReadings: [], kunReadings: [], meanings: [])
        
        
        let testLesson : Lesson = Lesson(id: 1, name: name, isDefault: true)
        
        let lessonXKanji : LessonXKanji = LessonXKanji(id: 1, lesson: testLesson, kanji: [testKanji, testKanji2])
        
        return lessonXKanji
    }
}
