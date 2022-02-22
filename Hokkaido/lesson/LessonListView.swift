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
        ZStack {
            List(lessonXKanjis) { lxk in
                        NavigationLink(destination: LessonDetailView(lxk: lxk)) {
                            LessonListItemView(lessonXKanji: lxk)
                        }
                }.listStyle(.plain)
        }
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
