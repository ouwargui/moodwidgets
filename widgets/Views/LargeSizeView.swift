//
//  LargeSizeView.swift
//  widgetsExtension
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

struct LargeSizeView: View {
  var entry: SimpleEntry

  var body: some View {
    VStack {
      HStack(spacing: 16) {
        Text("My TODOs")

        Text(Date.now, format: .dateTime)

        Spacer()
      }
      .padding(8)
      .background(.blue)
      .foregroundColor(.white)
      .clipped()
      .shadow(radius: 5)

      ForEach(0 ..< 10, id: \.self) { _ in
        HStack {
          Circle()
            .stroke(lineWidth: 2)
            .frame(width: 30, height: 30)
            .overlay {
              if true {
                Image(systemName: "checkmark")
              }
            }
          Text("TODO Title")

          Spacer()
        }
        .padding(.horizontal)

        Divider()
      }
    }
  }
}
