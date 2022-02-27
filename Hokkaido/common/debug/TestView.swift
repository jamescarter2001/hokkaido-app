//
//  TestView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var kanjiData : KanjiData
    
    let data : [String] = ["AAASSSSSSSSSSSSSSSSSA", "BBBB", "AAAA", "BBBB", "AAAA", "目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目"]
    var body: some View {
        Button("Run") {
            kanjiData.add(obj: Kanji(id: 5000, symbol: "A", name: "AAAA", onReadings: [], kunReadings: [], meanings: []))
            print("Added.")
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
