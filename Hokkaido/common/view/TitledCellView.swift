//
//  TitledCellView.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import SwiftUI

struct TitledCellView: View {
    let title : String
    let content : String
    
        var body: some View {
            HStack {
                VStack(alignment: .trailing) {
                    Text(title).font(.subheadline).foregroundColor(.gray)
                }.frame(width: 75, alignment: .trailing)
                VStack(alignment: .leading) {
                    Text(content)
                }
            }
    }
}

struct TitledCellView_Previews: PreviewProvider {
    static var previews: some View {
        TitledCellView(title: "Title", content: "Content")
    }
}
