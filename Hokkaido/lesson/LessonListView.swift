//
//  TestView.swift
//  Hokkaido
//
//  Created by James on 20/02/2022.
//

import SwiftUI

struct LessonListView: View {
    let lessonService : LessonService = LessonService()
    
    @State var lessonXKanjis : [LessonXKanji] = []
    var body: some View {
        ZStack {
            List(lessonXKanjis) { lxk in
                        NavigationLink(destination: LessonDetailView(lxk: lxk)) {
                            HStack {
                                LessonListItemView(lessonXKanji: lxk)
                            }
                        }
                }.listStyle(.plain)
        }.onAppear() {
            if (self.lessonXKanjis.isEmpty) {
            lessonService.requestLessons(withCompletion: onRequest, endpoint: "/lesson")
            }
        }
    }
    private func onRequest(response: [LessonXKanji]) -> Void {
        lessonXKanjis = response
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessonXKanjis: [HkDebug.LoadTestData(name: "AAAA", symbol: "日")]).preferredColorScheme(.dark)
    }
}
