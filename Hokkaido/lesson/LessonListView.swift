//
//  TestView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct LessonListView: View {
    let lessonXKanjis : [LessonXKanji]
    var body: some View {
            List(lessonXKanjis) { lxk in
                ZStack(alignment: .leading) {
                    LessonListItemView(lessonXKanji: lxk)
                    NavigationLink(destination: LessonDetailView(lxk: lxk)) {
                        EmptyView()
                    }.opacity(0)
                }
                }.listStyle(.plain)
        NavigationLink(destination: EmptyView()) {
            EmptyView()
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessonXKanjis: [HkDebug.LoadTestData(name: "AAAA", symbol: "日")]).preferredColorScheme(.dark)
    }
}
