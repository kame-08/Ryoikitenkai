//
//  TenkaiViewModel.swift
//  Ryoikitenkai
//
//  Created by Ryo on 2022/11/23.
//

import Foundation

class TenkaiViewModel: ObservableObject {
    
    //行数
    @Published var rouNumInt = 1
    //行数を"1\n2"のようにStringでもつ
    @Published var rouNumStr = "1"
    
    func rowCount(text: String){
        let arr:[String] = text.components(separatedBy: "\n")
        rouNumInt = arr.count
        for i in 2..<arr.count + 1{
            rouNumStr += "\n\(i)"
        }
    }
}
