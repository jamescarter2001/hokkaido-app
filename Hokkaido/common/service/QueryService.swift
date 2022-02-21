//
//  QueryService.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import Foundation

class QueryService<T : Codable> {
    private var data : [T]
    
    init() {
        self.data = []
    }
    
    func requestLessons(withCompletion completion: @escaping ([T]) -> Void, endpoint: String) -> Void {
        let urlPath = String(format: "http://192.168.0.30:8080%@", endpoint)
        
        let url = URL(string: urlPath)!
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let data = data else {
                DispatchQueue.main.async {completion(self.data)}
                return
            }
            do {
                let decoder = JSONDecoder()
                let messages = try decoder.decode([T].self, from: data)

                self.data = messages
                DispatchQueue.main.async {completion(self.data)}
                return
            } catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
        }
        task.resume()
    }
}
