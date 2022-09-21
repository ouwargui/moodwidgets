//
//  SmallSizeView.swift
//  widgetsExtension
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

// https://avatars.githubusercontent.com/u/44242141?v=4

struct SmallSizeView: View {
  var entry: SimpleEntry

  var body: some View {
    ZStack(alignment: .bottomLeading) {
      HStack {
        Spacer()

        VStack(spacing: 2) {
          Spacer()

          Image(systemName: "face.smiling")
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)

          Text("Happy")
            .foregroundColor(.white)
            .fontWeight(.bold)

          Spacer()
          Spacer()
        }

        Spacer()
      }
      if let image = entry.image {
        HStack {
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(width: 30, height: 30)
            .padding([.bottom, .leading], 5)
            .shadow(radius: 10)

          Text("5 min ago")
            .font(.subheadline)
            .foregroundColor(.white)
            .fontWeight(.semibold)
            .padding([.bottom], 5)
        }
      }
    }
    .background(Color(red: 255 / 255, green: 150 / 255, blue: 175 / 255))
    .opacity(0.8)
    .widgetURL(URL(string: "moodywidgets://todo/1"))
  }
}

struct Previews_SmallSizeView_Previews: PreviewProvider {
  static var previews: some View {
    SmallSizeView(entry: SimpleEntry(date: .now, image: Image(systemName: "trophy.fill")))
      .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}
