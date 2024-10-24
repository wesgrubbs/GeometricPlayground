//
//  CircularOrbitView.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

struct CircleOrbitView: View {
    @State private var rotationAngle: Double = 0 // Track the current rotation angle

    let radius: CGFloat = 100 // Radius of the orbit
    let animationSpeed: Double = 5.0 // Time to complete one orbit (seconds)

    var body: some View {
        ZStack {
            // Center Circle
            Circle()
                .fill(Color.gray)
                .frame(width: 50, height: 50)

            // Orbiting Circle
            Circle()
                .fill(Color.blue)
                .frame(width: 20, height: 20)
                .offset(x: radius, y: 0) // Start at the edge of the orbit
                .rotationEffect(.degrees(rotationAngle), anchor: .center) // Rotate around the center
        }
        .onAppear {
            startOrbitAnimation() // Start the orbit animation when view appears
        }
    }

    // Function to animate the orbit
    private func startOrbitAnimation() {
        withAnimation(Animation.linear(duration: animationSpeed).repeatForever(autoreverses: false)) {
            rotationAngle = 360 // Complete a full rotation (360 degrees)
        }
    }
}

#Preview {
    CircleOrbitView()
}
