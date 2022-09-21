//
//  ContentView.swift
//  moodwidgets
//
//  Created by Guilherme Santos on 15/09/22.
//

import SwiftUI

struct ContentView: View {
  @State private var showingAlert = false
  @State private var todos = [String]()
  @State private var newTodo = ""

  var body: some View {
    NavigationStack {
      VStack {
        List(todos, id: \.self) { todo in
          Text(todo)
        }
        TextField(
          "Add TODO",
          text: $newTodo
        )
        .autocorrectionDisabled(false)
        .border(.secondary)
        Button(action: {
          todos.append(newTodo)
        }, label: {
          Text("Add TODO")
        })
      }
      .navigationTitle(Text("Hello Swift"))
      .alert(isPresented: $showingAlert) {
        Alert(title: Text("Você clicou no Denis"), message: Text("Que maluco feio!!!"), dismissButton: .cancel())
      }
    }
    .onOpenURL { url in
      guard
        url.scheme == "moodywidgets",
        url.host == "todo",
        let _ = Int(url.pathComponents[1])
      else {
        print("error")
        return
      }

      showingAlert = true
    }
  }
}
