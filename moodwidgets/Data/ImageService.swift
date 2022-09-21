//
//  ImageService.swift
//  moodwidgets
//
//  Created by Guilherme Santos on 16/09/22.
//

import Foundation
import SwiftUI

final class ImageService {
  static let shared = ImageService()
    
  private let baseUrl: String = "https://avatars.githubusercontent.com/u/12648379?v=4"
    
  private func fetch(from endpoint: String) async throws -> Image {
    let urlString = baseUrl
    guard let url = URL(string: urlString) else {
      throw URLError(.badURL)
    }
        
    let (data, _) = try await URLSession.shared.data(from: url)
        
    guard let uiImage = UIImage(data: data) else { throw URLError(.badURL) }
    let image = Image(uiImage: uiImage)
        
    return image
  }
    
  func fetchImage() async throws -> Image {
    let image: Image = try await fetch(from: "")
    return image
  }
}
