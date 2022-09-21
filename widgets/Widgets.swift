//
//  widgets.swift
//  widgets
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

@main
struct Widgets: Widget {
  let kind: String = "widgets"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      WidgetView(entry: entry)
    }
    .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    .configurationDisplayName("Moody Widgets")
    .description("Know your friends' mood in real time with this widget!")
  }
}
