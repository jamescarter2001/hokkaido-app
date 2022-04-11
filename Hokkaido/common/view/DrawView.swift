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
            
            let dashCount = size.width / 29.5
            let dashStrokeLength = (dashCount / 4) * 2
            let dashSpaceLength = (dashCount / 4) * 2
            
            let top = CGPoint(x: (size.width / 2), y: 0)
            let bottom = CGPoint(x: (size.width / 2), y: size.height)
            let left = CGPoint(x: 0, y: (size.height / 2))
            let right = CGPoint(x: size.width, y: (size.height / 2))
            
            gridPath.addLines([top, bottom])
            gridPath.move(to: left)
            gridPath.addLines([left, right])
            
            context.stroke(gridPath, with: .color(.gray), style: StrokeStyle(lineWidth: 2, lineCap: .round, dash: [dashStrokeLength, dashSpaceLength]))
            
            for line in lines {
                let path = engine.createPath(points: line.points)
                
                context.stroke(path, with: .color(colorScheme == .dark ? .white : .black), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
        }.aspectRatio(1, contentMode: .fit)
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView(lines: [])
    }
}
