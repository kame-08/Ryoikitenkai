//
//  CodeView.swift
//  Ryoikitenkai
//
//  Created by Ryo on 2022/11/23.
//

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
                        .lineLimit(isfull ? nil : 10)
                    VStack(spacing: 0) {
                        ScrollView(.horizontal) {
                            Text(code)
                                .font(.system(.body, design: .monospaced))
                                .lineLimit(isfull ? nil : 10)
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

struct CodeView_Previews: PreviewProvider {
    static var previews: some View {
        CodeView(code: "Code1\nCode2", rouNumInt: 2, rouNumStr: "1\n2")
    }
}
