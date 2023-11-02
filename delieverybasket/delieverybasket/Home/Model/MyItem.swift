//
//  MyItem.swift
//  delieverybasket
//
//  Created by 김민솔 on 2023/10/30.
//


import UIKit
struct MyItem {
   // var image: UIImage
    var title: String
    var subtitle: String
    var isChoice: Bool // 필수, 선택
    var isChecked: Bool
    var image: UIImage? {
            if isChoice {
                return isChecked ? UIImage(named: "fullcircle")! : UIImage(named: "circle")!
            } else {
                return isChecked ? UIImage(named: "checkbox")! : UIImage(named: "unchecked")!
            }
        }
    init(title: String, subtitle: String, isChoice: Bool, isChecked: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.isChoice = isChoice
        self.isChecked = isChecked
    }
}


