//
//  Lesson.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import Foundation

struct Lesson : Codable {
    let id: Int64
    let name: String
    let isDefault: Bool
    
    init(id: Int64, name: String, isDefault: Bool) {
        self.id = id
        self.name = name
        self.isDefault = isDefault
    }
}
