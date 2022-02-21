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
            if (lessonXKanjis.count > 0) {
                List {
                    ForEach((0...lessonXKanjis.count-1), id: \.self) { i in
                        NavigationLink(destination: LessonDetailView(lxk: lessonXKanjis[i])) {
                            LessonListItemView( lessonXKanji: lessonXKanjis[i])
                        }
                    }
                }.listStyle(.plain)
            } else {
                ProgressView()
            }
        }.onAppear() {
            lessonService.requestLessons(withCompletion: onRequest, endpoint: "/lesson")
        }
    }
    private func onRequest(response: [LessonXKanji]) -> Void {
        lessonXKanjis = response
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView(lessonXKanjis: []).preferredColorScheme(.dark)
    }
}
