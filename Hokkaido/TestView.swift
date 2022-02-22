//
//  TestView.swift
//  Hokkaido
//
//  Created by James on 21/02/2022.
//

import SwiftUI

struct TestView: View {
    
    let data : [String] = ["AAASSSSSSSSSSSSSSSSSA", "BBBB", "AAAA", "BBBB", "AAAA", "目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目目"]
    var body: some View {
        NavigationView {
            List {
                ForEach(0...data.count-1, id: \.self) { i in
                        NavigationLink(destination: TestView2()) {
                            VStack {
                            Text(String(format: "Item %d", i))
                            Text(data[i])
                            }
                        }
                }
            }.listStyle(.plain)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
