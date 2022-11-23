//
//  TenkaiView.swift
//  Ryoikitenkai
//
//  Created by Ryo on 2022/11/23.
//

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

struct TenkaiView_Previews: PreviewProvider {
    static var previews: some View {
        TenkaiView(code: .constant("Code"))
    }
}
