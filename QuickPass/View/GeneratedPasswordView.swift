//
//  GeneratedPasswordView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 16/04/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct GeneratedPasswordView: View {
    var viewModel: HomeViewModel
    var password: String {
        viewModel.genPassword
    }
    @State private var copyToClipBoard = false
    var body: some View {
        VStack(spacing: 10) {
            Text("CREATE RANDOM PASSWORD")
                .font(.headline.bold())
                .foregroundStyle(.secondary)

            Text(
                password
            )
            .font(.title2.bold())
            .foregroundStyle(.white).multilineTextAlignment(.center)

            HStack {
                Button {
                    viewModel.generatePassword()
                } label: {
                    Image(
                        systemName:
                            "arrow.trianglehead.2.counterclockwise.rotate.90"
                    )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .contentShape(Rectangle())
                }
                .frame(minWidth: 44, minHeight: 44)
                .buttonBorderShape(.circle)
                .buttonStyle(.borderedProminent)
                .tint(.white.opacity(0.15))

                Button {
                    copyToClipBoard = true
                    UIPasteboard.general.setValue(
                        viewModel.genPassword,
                        forPasteboardType: UTType.plainText.identifier
                    )
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            copyToClipBoard = false
                        }
                    }
                } label: {
                    Text("COPY")
                        .foregroundStyle(.white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 44, minHeight: 44)
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .tint(.white.opacity(0.15))
            }
            .padding(.vertical, 10)
        }.frame(maxWidth: .infinity, alignment: .top).overlay {
            if copyToClipBoard {
                Text("copied to the clipboard").font(.caption)
                    .foregroundStyle(.white)
                    .padding(8)
                    .background(.green.opacity(0.85))
                    .cornerRadius(10)
                    .offset(y: copyToClipBoard ? -100 : 0)  // starts from below
                    .opacity(copyToClipBoard ? 1 : 0)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(
                        .easeInOut(duration: 0.25),
                        value: copyToClipBoard
                    )
            }
        }
    }
}

#Preview {
    VStack {
        GeneratedPasswordView(viewModel: HomeViewModel())

    }.background(.black)
}
