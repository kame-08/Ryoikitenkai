//
//  ContentView.swift
//  Ryoikitenkai
//
//  Created by Ryo on 2022/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Section("hello_world.swift") {
                    TenkaiView(code: $viewModel.code)
                }
                Section("ContentView.swift") {
                    TenkaiView(code: $viewModel.code1)
                }
                Section("TenkaiView.swift") {
                    TenkaiView(code: $viewModel.code2)
                }
                Section("CodeView.swift") {
                    TenkaiView(code: $viewModel.code3)
                }
            }
            .listStyle(.plain)
            .navigationTitle("CodeSample")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
