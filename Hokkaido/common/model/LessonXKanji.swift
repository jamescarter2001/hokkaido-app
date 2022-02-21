//
//  LessonXKanji.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import Foundation

struct LessonXKanji : Codable {
    let lesson : Lesson
    let kanji : [Kanji]
    
    init(lesson: Lesson, kanji: [Kanji]) {
        self.lesson = lesson
        self.kanji = kanji
    }
}
