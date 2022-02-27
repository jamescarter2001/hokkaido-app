//
//  KanjiContainerView.swift
//  Hokkaido
//
//  Created by James on 22/02/2022.
//

import SwiftUI

struct KanjiContainerView: View {
    @EnvironmentObject var kanjiData : KanjiData
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                KanjiListView(kanji: filterData(kanji: kanjiData.data, search: searchText), searchText: searchText).navigationTitle("Kanji").searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }.navigationTitle("Kanji")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func filterData(kanji: [Kanji], search: String) -> [Kanji] {
        if (search == "") {
            return kanji
        }
        
        return kanji.filter { $0.name.uppercased().contains(search.uppercased()) || String($0.id).contains(search) || arrayContains(arr: $0.meanings, str: search) }
    }
    
    private func arrayContains(arr: [String], str : String) -> Bool {
        for s in arr {
            if s.uppercased().contains(str.uppercased()) {
                return true
            }
        }
        return false
    }
}

/*struct KanjiContainerView_Previews: PreviewProvider {
    static var previews: some View {
        KanjiContainerView()
    }
}*/
