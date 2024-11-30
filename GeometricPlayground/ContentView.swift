//
//  ContentView.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfCols = Int.random(in: 1...8)
    @State private var redrawTrigger = false
    
    var body: some View {
        let numberOfCircles: Int = 120
        let screenWidth = UIScreen.main.bounds.width
        let colWidth = screenWidth / CGFloat(numberOfCols)
        
        ScrollView {
            LazyVGrid(
                columns: Array(repeating: GridItem(.fixed(CGFloat(colWidth)), spacing: 1), count: numberOfCols),
                spacing: 1
            ) {
                ForEach(0..<numberOfCircles) { index in
                    SquareView1(squareSize: colWidth)
                }
            }
            .padding(0)
            .id(redrawTrigger)  // Force redraw when this changes
        }
        .padding(0)
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            withAnimation {
                numberOfCols = Int.random(in: 1...8)
                redrawTrigger.toggle()  // Toggle to force redraw
            }
        }
    }
}

#Preview {
    ContentView()
}
