//
//  ContentView.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

func getRandomColor() -> Color {
    let colors = [
        Color.black,
        Color.red,
        Color(hex: "#01140E"),
        Color(hex: "#008148"),
        Color(hex: "#C6C013"),
        Color(hex: "#EF8A17"),
        Color(hex: "#EF2917"),
    ]
    return colors.randomElement() ?? Color.black
}

struct ContentView: View {
    // State variables for animation
    @State private var randDegrees = Double.random(in: 0...360)
    @State private var prevRandDegrees = 0.0
    @State private var randScale = Double.random(in: 0.5...1.5)
    @State private var numberOfCols = 2
    @State private var animationTrigger = false
    @State private var backgroundColor = Color.black
    @State private var hasChangedBackground = false
    @State private var finalScale = 1.0
    @State private var currentRotation = 0.0
    @State private var targetFinalScale = 1.0
    
    // Animation phases
    enum AnimationPhase: Hashable, CaseIterable {
        case initial
        case scaleFirst
        case rotate
        case scaleFinal
    }
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
        let colWidth = screenWidth / CGFloat(numberOfCols)
        
        HStack {
            Spacer()
            
            // Using PhaseAnimator
            PhaseAnimator(
                AnimationPhase.allCases,
                trigger: animationTrigger
            ) { phase in
                SquareGradientView(squareSize: colWidth)
                    .rotationEffect(.degrees(
                        phase == .rotate || phase == .scaleFinal ? randDegrees : currentRotation
                    ))
                    .scaleEffect(
                        phase == .initial ? CGFloat(finalScale) :
                        phase == .scaleFirst ? CGFloat(Double.random(in: 0.7...1.2)) :
                        phase == .rotate ? CGFloat(randScale) :
                        CGFloat(targetFinalScale) // Use pre-determined final scale
                    )
            } animation: { phase in
                // Different animation timing for each phase
                switch phase {
                case .initial:
                    .easeInOut(duration: 0)
                case .scaleFirst:
                    .easeInOut(duration: 0.3)
                case .rotate:
                    .easeInOut(duration: 0.5)
                case .scaleFinal:
                    .spring(duration: 0.5, bounce: 0.3)
                }
            }
            .onChange(of: animationTrigger) { oldValue, newValue in
                // This will run after animation completes
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                    finalScale = targetFinalScale
                    currentRotation = randDegrees
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            // Generate new random values for the animation
            randDegrees = Double.random(in: 0...360)
            randScale = Double.random(in: 0.5...1.5)
            targetFinalScale = Double.random(in: 0.5...1.5) // Pre-determine final scale
            
            // Trigger the animation
            animationTrigger.toggle()
            
            // Change background color on every tap
            withAnimation(.easeInOut(duration: 0.8)) {
                backgroundColor = getRandomColor()
            }
        }
    }
}

#Preview {
    ContentView()
}
