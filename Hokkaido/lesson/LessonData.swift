//
//  LessonData.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import Foundation

class LessonData : ObservableData<LessonXKanji> {
    init() {
        super.init(resource: "lessons")
    }
}
