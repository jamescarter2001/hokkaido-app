//
//  LessonContainerView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonContainerView: View {
    let lessonService : LessonService = LessonService()
    
    var body: some View {
        NavigationView {
                LessonListView()
            }.navigationTitle("Lessons")
    }
}

struct LessonContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonContainerView()
    }
}
