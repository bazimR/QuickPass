//
//  DividerView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 16/04/25.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1.5)
            .foregroundStyle(.secondary)
    }
}

#Preview {
    DividerView()
}
