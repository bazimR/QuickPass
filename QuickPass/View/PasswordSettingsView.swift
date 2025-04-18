//
//  PasswordSettingsView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 15/04/25.
//

import SwiftUI

struct PasswordSettingsView: View {
    var viewModel: HomeViewModel
    var body: some View {
        VStack(spacing: 20) {
            Text("PASSWORD SETTINGS")
                .font(.caption).fontWeight(.bold)
                .foregroundStyle(.secondary)
            Grid {
                GridRow {
                    LabelButton(
                        passwordOption: .lowerCase,
                        viewModel: viewModel
                    )
                    LabelButton(
                        passwordOption: .upperCase,
                        viewModel: viewModel
                    )

                }
                GridRow {
                    LabelButton(passwordOption: .numbers, viewModel: viewModel)
                    LabelButton(passwordOption: .symbols, viewModel: viewModel)

                }

                GridRow {
                    LabelButton(
                        passwordOption: .excludeDuplicates,
                        viewModel: viewModel
                    )
                    LabelButton(
                        passwordOption: .includeSpace,
                        viewModel: viewModel
                    )
                }

            }
        }
    }
}

#Preview {
    ZStack {
        Color(.black)
        PasswordSettingsView(viewModel: HomeViewModel())
    }

}
