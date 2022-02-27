//
//  KanjiData.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import Foundation

class ObservableData<T : Codable> : ObservableObject {
    @Published var data : [T] = []
    let url : URL
    
    init(resource: String) {
        self.url = Bundle.main.url(forResource: resource, withExtension: ".json")!
        load()
    }
    
    private func load() {
        let jsonData = try? Data(contentsOf: self.url)
        let decodedJson = try? JSONDecoder().decode([T].self, from: jsonData!)
        self.data = decodedJson ?? []
    }
    
    func add(obj : T) {
        self.data.append(obj)
        
        guard let jsonData = try? JSONEncoder().encode(self.data) else {
            print("JSON encode error.")
            return
        }
        try? jsonData.write(to: self.url)
    }
}
