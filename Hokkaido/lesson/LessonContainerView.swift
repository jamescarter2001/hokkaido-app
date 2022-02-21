//
//  LessonContainerView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct LessonContainerView: View {
    let lessonService : LessonService = LessonService()
    
    @State var fadeInOut : Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                LessonListView().onAppear() {
                    withAnimation(Animation.easeIn(duration: 0.4)) {
                        fadeInOut = true
                    }
                }.opacity(fadeInOut ? 1 : 0)
            }.navigationTitle("Lessons")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LessonContainerView_Previews: PreviewProvider {
    static var previews: some View {
        LessonContainerView()
    }
}
