//
//  CircleView2.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 11/13/24.
//

//
//  Circle.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//
import SwiftUI

struct CircleView2: View {
    @State private var rotationAngle: Double = 0
    @State private var orbitRadius: CGFloat = 0
    @State private var circleSize: CGFloat = 0
    @State private var mainCircleSize: CGFloat = 0
    @State private var animationDirection: Double = 1
    
    var circleToSize: CGFloat = 280
    var rotationAngleFrom: Double = 4.0
    var rotationAngleTo: Double = 60.0
    var smallCircleColor: Color = .black
    
    var body: some View {
        ZStack {
            // Main Circle
            Circle()
                .foregroundColor(.white)
                .frame(width: mainCircleSize, height: mainCircleSize)
            
            // Orbiting Circle
            Circle()
                .foregroundColor(smallCircleColor)
                .frame(width: circleSize, height: circleSize)
                .offset(x: orbitRadius, y: 0)
                .rotationEffect(.degrees(rotationAngle), anchor: .center)
        }
        .onAppear {
            startAnimationSequence()
        }
        .background(Color.black)
    }
    
    private func startAnimationSequence() {
        // Initial delay before anything starts
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Random delay between 0.1 and 0.9 seconds for first circle
            let randomDelay = Double.random(in: 0.1...0.9)
            
            // Animate the main circle
            DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
                withAnimation(.easeInOut(duration: 0.8)) {
                    mainCircleSize = circleToSize
                }
                
                // Start the orbiting sequence after main circle animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + randomDelay) {
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
            orbitRadius = CGFloat.random(in: 0...circleToSize * 0.5)
            circleSize = CGFloat.random(in: 0...circleToSize)
            rotationAngle = animationDirection * Double.random(in: rotationAngleFrom...rotationAngleTo)
        }
        
        // Step 2: Additional rotation animation
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 2)) {
                rotationAngle += 180 // Rotate by 180 degrees
            }
            
            // Step 3: Hold for 4 seconds, then animate back to center and shrink
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) { // 2s animation + 4s hold
                withAnimation(.easeInOut(duration: 1.5)) {
                    orbitRadius = 0
                    circleSize = 0
                }
                
                // Step 4: Restart the animation after shrinking back to center
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    resetAndRestartAnimation()
                }
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
    CircleView2()
}
