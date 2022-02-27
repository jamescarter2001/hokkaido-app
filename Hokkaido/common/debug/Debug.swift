//
//  debug.swift
//  Hokkaido
//
//  Created by James on 22/02/2022.
//

import Foundation

class HkDebug {
    static func DummyKanji1() -> Kanji {
        return Kanji(id: 1, symbol: "木", name: "Test", onReadings: ["on", "on"], kunReadings: ["kun", "kun"], meanings: ["hello", "there"])
    }
    
    static func DummyKanji2() -> Kanji {
        return Kanji(id: 2, symbol: "目", name: "Hello", onReadings: [], kunReadings: [], meanings: [])
    }
    
    static func LoadTestData(name: String, symbol: String) -> LessonXKanji {
        let testKanji : Kanji = DummyKanji1()
        let testKanji2 : Kanji = DummyKanji2()
        
        let testLesson : Lesson = Lesson(id: 1, name: name, isDefault: true)
        
        let lessonXKanji : LessonXKanji = LessonXKanji(id: 1, lesson: testLesson, kanji: [testKanji, testKanji2])
        
        return lessonXKanji
    }
}
