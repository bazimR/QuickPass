//
//  LabelButton.swift
//  QuickPass
//
//  Created by Rishal Bazim on 15/04/25.
//

import SwiftUI

struct LabelButton: View {
    var passwordOption: PasswordOption
    var viewModel: HomeViewModel
    var body: some View {
        Button {
            viewModel.toggleOptions(option: passwordOption)
        } label: {
            Text(passwordOption.title).font(.subheadline).fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
        }.buttonStyle(.borderedProminent).tint(
            .white.opacity(0.1)
        ).buttonBorderShape(.roundedRectangle(radius: 15)).padding(5).overlay {
            if viewModel.activeOptions.contains(passwordOption) {
                RoundedRectangle(cornerRadius: 20).stroke(.white, lineWidth: 2)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.black)
        LabelButton(passwordOption: .lowerCase, viewModel: HomeViewModel())
    }
}
