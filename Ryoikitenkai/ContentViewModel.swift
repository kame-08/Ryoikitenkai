//
//  ContentViewModel.swift
//  Ryoikitenkai
//
//  Created by Ryo on 2022/11/23.
//

import Foundation

class ContentViewModel: ObservableObject {
    
    @Published var count = 0
    var rouNum = "1"
    
    @Published var code = """
    print("Hello, world!")
"""
    
    @Published var code1 = """
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
"""
    
    @Published var code2 = """
import SwiftUI

struct TenkaiView: View {
    
    @ObservedObject var viewModel = TenkaiViewModel()
    @Binding var code: String
    
    var body: some View {
        VStack{
            if viewModel.rouNumInt <= 10{
                CodeView(code: code, rouNumInt: viewModel.rouNumInt, rouNumStr: viewModel.rouNumStr)
            } else {
                CodeView(code: code, rouNumInt: viewModel.rouNumInt, rouNumStr: viewModel.rouNumStr)
            }
        }
        .task {
            viewModel.rowCount(text: code)
        }
    }
}
"""
    
    @Published var code3 = """
import SwiftUI

struct CodeView: View {
    
    @State var code: String
    @State var isfull = false
    @State var rouNumInt: Int
    @State var rouNumStr: String
    @State var copyFlag = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack() {
                HStack(spacing: 0) {
                    Text(rouNumStr)
                        .foregroundColor(Color.gray)
                        .lineLimit(isfull ? 500 : 10)
                    VStack(spacing: 0) {
                        ScrollView(.horizontal) {
                            Text(code)
                                .font(.system(.body, design: .monospaced))
                                .lineLimit(isfull ? 500 : 10)
                        }
                    }
                }
                if rouNumInt > 10 {
                    Button {
                        isfull.toggle()
                    } label: {
                        Text(isfull ? "閉じる" : "🤞領域展開🤞")
                    }
                    .buttonStyle(.bordered)
                }
            }
            Button {
                //フィードバック
                UINotificationFeedbackGenerator().notificationOccurred(.success)
                //Pasteboardに値を入れる
                UIPasteboard.general.string = code
                
                copyFlag = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    copyFlag = false
                }
            } label: {
                Image(systemName: copyFlag ? "checkmark" : "doc.on.doc")
            }
            .buttonStyle(.borderless)
        }
    }
}
"""
}
