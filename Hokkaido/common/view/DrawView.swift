//
//  DrawView.swift
//  Hokkaido
//
//  Created by James on 26/02/2022.
//

import SwiftUI

struct DrawView: View {
    @Environment(\.colorScheme) var colorScheme
    let lines : [Line]
    
    let engine : DrawingEngine = DrawingEngine()
    var body: some View {
        Canvas { context, size in
            var gridPath = Path()
            var gridPath2 = Path()
            
            let top = CGPoint(x: (size.width / 2), y: -2.5)
            let bottom = CGPoint(x: (size.width / 2), y: size.height)
            let left = CGPoint(x: -2.5, y: (size.height / 2))
            let right = CGPoint(x: size.width, y: (size.height / 2))
            
            gridPath.addLines([top, bottom])
            gridPath2.addLines([left, right])
            
            context.stroke(gridPath, with: .color(.gray), style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [5]))
            context.stroke(gridPath2, with: .color(.gray), style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [5]))
            
            for line in lines {
                let path = engine.createPath(points: line.points)
                
                context.stroke(path, with: .color(colorScheme == .dark ? .white : .black), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }.frame(width: 350, height: 350)
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView(lines: [])
    }
}
