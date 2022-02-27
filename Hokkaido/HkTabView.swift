//
//  HkTabView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct HkTabView: View {
    @StateObject var kanji : KanjiData = KanjiData()
    @StateObject var lessonXKanjis : LessonData = LessonData()
    var body: some View {
        TabView {
            /*HomeContainerView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }*/
            KanjiContainerView().environmentObject(kanji)
                .tabItem() {
                    Image(systemName: "magnifyingglass")
                    Text("Kanji")
                }
            LessonContainerView().environmentObject(lessonXKanjis)
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Lessons")
                }
            /*TestView().environmentObject(kanji).tabItem {
                Image(systemName: "exclamationmark.triangle")
                Text("Debug")
            }*/
        }.accentColor(.red)
    }
}

struct HkTabView_Previews: PreviewProvider {
    static var previews: some View {
        HkTabView()
    }
}
