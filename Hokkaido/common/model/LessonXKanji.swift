//
//  LessonXKanji.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import Foundation

struct LessonXKanji : Identifiable, Codable, Equatable {
    let id : Int64
    let lesson : Lesson
    let kanji : [Kanji]
    
    init(id : Int64, lesson: Lesson, kanji: [Kanji]) {
        self.id = id
        self.lesson = lesson
        self.kanji = kanji
    }
    
    static func ==(lhs: LessonXKanji, rhs: LessonXKanji) -> Bool {
        return lhs.id == rhs.id
    }
}
