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
    //@State private var numberOfCols = Int.random(in: 1...8)
    @State private var randDegrees = Double.random(in: 0...360)
    @State private var randScale = Double.random(in: 0.5...1.5)
    @State private var numberOfCols = 2
    @State private var redrawTrigger = false
    
    var body: some View {
        let numberOfCircles: Int = 1
        let screenWidth = UIScreen.main.bounds.width
        let colWidth = screenWidth / CGFloat(numberOfCols)
        
        HStack {
            
            Spacer()
            SquareGradientView(squareSize: colWidth)
                .rotationEffect(.degrees(randDegrees))
                .scaleEffect(CGFloat(randScale))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(getRandomColor())
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation {
                randDegrees = Double.random(in: 0...360)
                randScale = Double.random(in: 0.5...1.5)
                redrawTrigger.toggle()  // Toggle to force redraw
            }
        }
    }
}

#Preview {
    ContentView()
}
