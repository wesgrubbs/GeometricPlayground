//
//  SquareGradientView.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 11/30/24.
//

import SwiftUI

struct SquareGradientView: ShapeStyle, View {
    
    var squareSize: CGFloat = 200
    private var rotation: Double {
        Double([0, 45, 90, 135, 180, 225, 270].randomElement() ?? 0)
    }
    let cornerRadius: CGFloat = 16
    
    var body: some View {
        
        HStack(spacing: 0) {
            Rectangle()
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color(hex: "#01140E"),
                            Color(hex: "#EF2917"),
                            Color(hex: "#EF8A17")
                        ]),
                        center: .center,
                        angle: .degrees(0)
                    )
                )
                .frame(width: squareSize, height: squareSize)
                .cornerRadius(cornerRadius)
            
            Rectangle()
                .fill(
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color(hex: "#01140E"),
                            Color(hex: "#EF2917"),
                            Color(hex: "#EF8A17")
                        ]),
                        center: .center,
                        angle: .degrees(180)
                    )
                )
                .frame(width: squareSize, height: squareSize)
                .scaleEffect(
                    //x: ([0, 45].contains(rotation)) ? 1 : -1,
                    y: -1
                )
                .cornerRadius(cornerRadius)
        }
        
        
    }
}

#Preview {
    SquareGradientView()
}
