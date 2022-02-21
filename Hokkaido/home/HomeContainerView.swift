//
//  HomeContainerView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct HomeContainerView: View {
    var body: some View {
        NavigationView {
            HomeView().navigationTitle("こんにちは")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView()
    }
}
