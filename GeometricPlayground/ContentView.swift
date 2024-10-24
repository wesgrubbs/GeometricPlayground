//
//  ContentView.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LazyVGrid (columns: Array(repeating: GridItem(.fixed(100)), count: 3)){
            
            CircleView()
            CircleView()
            CircleView()
            
            CircleView()
            CircleView()
            CircleView()
            
            CircleView()
            CircleView()
            CircleView()
            
            CircleView()
            CircleView()
            CircleView()
        }
        .padding(.all)
        .frame(width: 500, height: 800)
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
