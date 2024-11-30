//
//  SquareView1.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 11/17/24.
//

import SwiftUI

struct SquareView1: View {
    @State private var animate = false
    var squareSize: CGFloat = 200
    let rotation = Double([0, 90, 180, 270].randomElement() ?? 0)
    
    var body: some View {
        SquareShape(progress: animate ? 1 : 0)
            .frame(width: squareSize, height: squareSize)
            .foregroundColor(.white)
            .background(Double.random(in: 0...1) < 0.15 ? .red : .black)
            .padding(0)
            .rotationEffect(.degrees(rotation))
            .onAppear {
                withAnimation(.easeInOut(duration: 2.0)) {
                    animate = true
                }
            }
    }
}

struct SquareShape: Shape {
    var progress: Double
    let randomHeight1: CGFloat = .random(in: 0...1)  // Store random values
    let randomHeight2: CGFloat = .random(in: 0...1)  // Store random values
    
    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height * randomHeight1 * progress))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height * randomHeight2 * progress))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

#Preview {
    SquareView1()
}
