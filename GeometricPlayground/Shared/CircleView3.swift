//
//  CircleView3.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 11/15/24.
//

import SwiftUI

struct CircleView3: View {
    @State private var rotationAngle: Double = 0
    @State private var orbitRadius: CGFloat = 0
    @State private var circleSize: CGFloat = 80
    @State private var mainCircleSize: CGFloat = 60
    @State private var animationDirection: Double = 1
    
    var circleToSize: CGFloat = 280
    var rotationAngleFrom: Double = 4.0
    var rotationAngleTo: Double = 60.0
    var smallCircleColor: Color = .black
    
    var body: some View {
        SliceShape()
            .stroke(lineWidth: 5)
            .frame(width:circleToSize, height: circleToSize)
            .foregroundColor(.yellow)
            .background(.red)
            .padding(0)
    }
}

struct SliceShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            //path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: .degrees(0),
                endAngle: .degrees(180),
                clockwise: true)
        }
    }
}

#Preview {
    CircleView3()
}
