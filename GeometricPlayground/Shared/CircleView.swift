//
//  Circle.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//
import SwiftUI

struct CircleView: View {
    @State private var rotationAngle: Double = 0
    @State private var orbitRadius: CGFloat = 0
    @State private var circleSize: CGFloat = 0
    @State private var mainCircleSize: CGFloat = 0 // This will animate from 0 to 80
    @State private var animationDirection: Double = 1

    var body: some View {
        ZStack {
            // Main Circle (now using mainCircleSize for animation)
            Circle()
                .foregroundColor(Color(hex: "#F3B61F"))
                .frame(width: mainCircleSize, height: mainCircleSize) // Use mainCircleSize here

            // Orbiting Circle
            Circle()
                .foregroundColor(Color(hex: "#C03221"))
                .frame(width: circleSize, height: circleSize)
                .offset(x: orbitRadius, y: 0)
                .rotationEffect(.degrees(rotationAngle), anchor: .center)
        }
        .onAppear {
            startAnimationSequence()
        }
    }

    private func startAnimationSequence() {
        // Initial delay before anything starts (e.g., 1 second)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Random delay between 0.2 and 0.8 seconds for first circle
            let randomDelay = Double.random(in: 0.2...0.8)
            
            // Then animate the main circle
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    mainCircleSize = 80
                }
                
                // Only start the orbiting sequence after main circle animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    determineDirection()
                    startOrbitingSequence()
                }
            }
        }
    }

    private func determineDirection() {
        animationDirection = Bool.random() ? 1 : -1
    }

    private func startOrbitingSequence() {
        
        // Step 1: Animate to orbit path while growing to final size
        withAnimation(.easeInOut(duration: 2)) {
            orbitRadius = CGFloat.random(in: 6...60)
            circleSize = CGFloat.random(in: 6...60)
            rotationAngle = animationDirection * Double.random(in: 45...420)
        }

        // Step 2: Animate back to center and shrink to size 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 1.5)) {
                orbitRadius = 0
                circleSize = 0
            }

            // Step 3: Restart the animation after shrinking back to center
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                resetAndRestartAnimation()
            }
        }
    }

    private func resetAndRestartAnimation() {
        rotationAngle = 0
        determineDirection()
        startOrbitingSequence()
    }
}
#Preview {
    CircleView()
}
