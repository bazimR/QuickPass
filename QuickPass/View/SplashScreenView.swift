//
//  SplashScreenView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 18/04/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Text("Quick pass").font(.largeTitle.bold()).foregroundStyle(.accent)
        }
    }

}

#Preview {
    SplashScreenView()
}
