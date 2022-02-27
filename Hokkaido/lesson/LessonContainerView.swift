//
//  LessonContainerView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonContainerView: View {
    @EnvironmentObject var lessonKanjiData : LessonData
    @State var loading = false
    @State var error = false
    
    var body: some View {
        NavigationView {
            VStack {
                if (error) {
                    ConnectionErrorView()
                } else if (loading) {
                    ProgressView()
                } else {
                    LessonListView(lessonXKanjis: lessonKanjiData.data)
                }
            }.navigationTitle("Lessons")
        }.navigationViewStyle(StackNavigationViewStyle()).onAppear() {
            /*lessonService.request(withCompletion: onRequest, endpoint: "/lesson")*/
        }
    }
    
    /*private func onRequest(response: [LessonXKanji], error: Bool) -> Void {
        if (self.lessonXKanjis.isEmpty && error) {
            self.error = true
        } else {
            self.error = false
        }
        
        if (self.lessonXKanjis != response) {
            self.lessonXKanjis = response
            self.loading = false
        }
    }*/
}

struct LessonContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonContainerView()
    }
}
