//
//  ConnectionErrorView.swift
//  Hokkaido
//
//  Created by James on 22/02/2022.
//

import SwiftUI

struct ConnectionErrorView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi.exclamationmark").font(.system(size: 100)).foregroundColor(.gray)
        }
    }
}

struct ConnectionErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectionErrorView()
    }
}
