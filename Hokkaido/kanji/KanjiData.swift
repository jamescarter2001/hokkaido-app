//
//  KanjiData.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import Foundation

class KanjiData : ObservableData<Kanji> {
    init() {
        super.init(resource: "kanji")
    }
}
