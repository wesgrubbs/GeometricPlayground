//
//  Circle.swift
//  GeometricPlayground
//
//  Created by Wesley Grubbs on 10/21/24.
//

import SwiftUI

struct Circle: View {
    @State private var isScaled = false

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(hex: "#F3B61F"))
                .scaleEffect(isScaled ? 1.0 : 0.1)
                .onAppear {
                    withAnimation(.easeOut(duration: 1.0)) {
                        isScaled = true  // Trigger animation when view appears
                    }
                }
        }

    }
}

#Preview {
    Circle()
}
