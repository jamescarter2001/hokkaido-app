//
//  LessonContainerView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonContainerView: View {
    let lessonService : LessonService = LessonService()
    
    @State var lessonXKanjis : [LessonXKanji] = []
    @State var loading = true
    @State var error = false
    
    var body: some View {
        NavigationView {
            VStack {
                if (error) {
                    ConnectionErrorView()
                } else if (loading) {
                    ProgressView()
                } else {
                    LessonListView(lessonXKanjis: lessonXKanjis)
                }
            }.navigationTitle("Lessons")
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear() {
            lessonService.requestLessons(withCompletion: onRequest, endpoint: "/lesson")
        }
    }
    
    private func onRequest(response: [LessonXKanji], error: Bool) -> Void {
        if (self.lessonXKanjis.isEmpty && error) {
            self.error = true
        } else {
            self.error = false
        }
        self.lessonXKanjis = response
        self.loading = false
    }
}

struct LessonContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonContainerView()
    }
}
