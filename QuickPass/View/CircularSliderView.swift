//
//  CircularSliderView.swift
//  QuickPass
//
//  Created by Rishal Bazim on 16/04/25.
//

import SwiftUI

struct CircularSliderView: View {
    var size: CGFloat = 250
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    var viewModel: HomeViewModel
    var passwordLength: Int {
        viewModel.passwordLength
    }
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color(.white).opacity(0.1),
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .butt,
                    )
                )
                .frame(width: size, height: size)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color(.accent),
                    style: StrokeStyle(
                        lineWidth: 30,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .frame(width: size, height: size)
                .rotationEffect(.init(degrees: 180))

            Circle()
                .fill(.white)
                .frame(width: 30, height: 30)
                .offset(
                    x: size / 2
                )
                .rotationEffect(.init(degrees: angle))
                .gesture(DragGesture().onChanged(onDrag(value:)))
                .rotationEffect(.init(degrees: 180))

            VStack(spacing: 8) {

                Text("Level").font(.caption).foregroundStyle(.white)
                passwordStrengthView()
                Text("\(passwordLength)")
                    .font(.title)
                    .fontWeight(.heavy).foregroundStyle(.white)

            }
        }.onChange(
            of: viewModel.passwordLength,
            {
                viewModel.generatePassword()
            }
        )
    }
    func passwordStrengthView() -> some View {
        withAnimation(.spring()) {
            switch passwordLength {
            case 15...18:
                return Text("Extreme")
                    .font(.subheadline.bold())
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(.purple)
                    .clipShape(.capsule)
            case 12...15:
                return Text("High")
                    .font(.subheadline.bold())
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(.red)
                    .clipShape(.capsule)
            case 8...12:
                return Text("Medium")
                    .font(.subheadline.bold())
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(.orange)
                    .clipShape(.capsule)
            default:
                return Text("Easy")
                    .font(.subheadline.bold())
                    .padding(5)
                    .padding(.horizontal, 10)
                    .background(.green)
                    .clipShape(.capsule)
            }

        }
    }
    func onDrag(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)

        let radians = atan2(vector.dy - size / 20, vector.dx - size / 20)

        var angle = radians * 180 / .pi

        if angle < 0 { angle = 360 + angle }
        if angle > 358 { return }
        let clampedAngle = min(angle, 360)
        withAnimation(.linear(duration: 0.15)) {
            let progess = clampedAngle / 360
            self.progress = progess
            self.angle = clampedAngle
            viewModel.passwordLength = Int(progess * (18 - 3) + 4)
        }
    }
}

#Preview {
    VStack {
        CircularSliderView(viewModel: HomeViewModel())
    }.background(.black)
}
