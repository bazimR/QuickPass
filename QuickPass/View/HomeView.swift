//
//  HomeView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 15/04/25.
//

import SwiftUI

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 40) {
                        VStack {
                            CircularSliderView(size: 225, viewModel: viewModel)
                        }
                        VStack {
                            PasswordSettingsView(viewModel: viewModel)
                            Spacer()
                            DividerView()
                        }
                        VStack {
                            GeneratedPasswordView(viewModel: viewModel)
                        }
                    }.padding([.horizontal, .vertical])
                }
            }
        }.colorScheme(.dark)
    }
}

#Preview {
    HomeView()
}
