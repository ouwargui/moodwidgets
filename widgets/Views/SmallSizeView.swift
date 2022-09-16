//
//  SmallSizeView.swift
//  widgetsExtension
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI
import WidgetKit

// https://avatars.githubusercontent.com/u/44242141?v=4

class ViewModel: ObservableObject {
    @Published var image: Image?

    func fetchNewImage() {
        guard let url = URL(string: "https://avatars.githubusercontent.com/u/44242141?v=4") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) {
            data, _, _ in guard let data = data else { return }

            DispatchQueue.main.async {
                guard let uiImage = UIImage(data: data) else { return }
                self.image = Image(uiImage: uiImage)
            }
        }

        task.resume()
    }
}

struct SmallSizeView: View {
    @StateObject var viewModel = ViewModel()

    var entry: SimpleEntry

    var body: some View {
        VStack {
            Image(systemName: "figure.basketball")
                .resizable()
                .scaledToFit()
                .foregroundColor(.accentColor)
                .padding()
            if let image = viewModel.image {
                image
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
            }
        }
        .background(.white)
        .onAppear {
            viewModel.fetchNewImage()
        }
        .widgetURL(URL(string: "moodywidgets://todo/1"))
    }
}
