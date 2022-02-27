//
//  DrawingEngine.swift
//  Hokkaido
//
//  Created by James on 26/02/2022.
//

import Foundation
import SwiftUI

class DrawingEngine {
    func createPath(points : [CGPoint]) -> Path {
        var path = Path()
        
        if let firstPoint = points.first {
            path.move(to: firstPoint)
        }
        
        for i in 1..<points.count {
            let mid = self.calcuateMidPoint(p1: points[i-1], p2: points[i])
            path.addQuadCurve(to: mid, control: points[i-1])
        }
        
        if let lastPoint = points.last {
            path.addLine(to: lastPoint)
        }
        
        return path
    }
    
    func calcuateMidPoint(p1 : CGPoint, p2: CGPoint) -> CGPoint {
        let mid = CGPoint(x: (p1.x + p2.x) / 2, y: (p1.y + p2.y) / 2)
        return mid
    }
}
