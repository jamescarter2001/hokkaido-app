//
//  LessonXKanji.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import Foundation

struct LessonXKanji : Identifiable, Codable {
    let id : Int
    let lesson : Lesson
    let kanji : [Kanji]
    
    init(id : Int, lesson: Lesson, kanji: [Kanji]) {
        self.id = id
        self.lesson = lesson
        self.kanji = kanji
    }
}
