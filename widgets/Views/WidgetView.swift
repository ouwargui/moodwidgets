//
//  WidgetView.swift
//  widgetsExtension
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

struct WidgetView: View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        switch widgetFamily {
            case .systemSmall:
                SmallSizeView(entry: entry)
            case .systemMedium:
                MediumSizeView(entry: entry)
            case .systemLarge:
                LargeSizeView(entry: entry)
            default:
                Text("Not implemented")
        }
    }
}
