//
//  Provider.swift
//  widgetsExtension
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), image: Image(systemName: "figure.basketball"))
  }

  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    Task {
      do {
        let image = try await ImageService.shared.fetchImage()
        let entry = SimpleEntry(date: .now, image: image)

        completion(entry)
      } catch {
        completion(SimpleEntry(date: .now, image: Image(systemName: "mic.fill")))
      }
    }
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
    Task {
      do {
        let image = try await ImageService.shared.fetchImage()
        let entry = SimpleEntry(date: .now, image: image)

        let timeline = Timeline(entries: [entry], policy: .after(.now.advanced(by: 60 * 60 * 30)))

        completion(timeline)
      } catch {
        let entries = [SimpleEntry(date: .now, image: Image(systemName: "mic.fill"))]
        let timeline = Timeline(entries: entries, policy: .after(.now.advanced(by: 60 * 60 * 30)))

        completion(timeline)
      }
    }
  }
}
