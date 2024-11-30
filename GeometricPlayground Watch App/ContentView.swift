//
//  ContentView.swift
//  GeometricPlayground Watch App
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            LazyVGrid (columns: Array(repeating: GridItem(.fixed(80)), count: 2)){
                //Spacer()
                
                CircleView1()

                CircleView1()
                
                CircleView1()
                
                CircleView1()
                
                //Spacer()
            }
            .padding(.all)
            .frame(width: 410, height: 800)
            .background(Color.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            //.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
