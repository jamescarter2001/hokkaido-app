//
//  HkTabView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct HkTabView: View {
    var body: some View {
        TabView {
            HomeContainerView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            LessonContainerView()
                .tabItem {
                    Image(systemName: "pencil")
                    Text("Lessons")
                }
        }
    }
}

struct HkTabView_Previews: PreviewProvider {
    static var previews: some View {
        HkTabView()
    }
}
