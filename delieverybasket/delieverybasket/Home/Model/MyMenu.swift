//
//  MyMenu.swift
//  delieverybasket
//
//  Created by 김민솔 on 2023/10/30.
//

import UIKit
struct MyMenu {
    var menuoption: String
    var ischoice: Bool
    var choicelabel : String
    var myitem : [MyItem]!
    init(menuoption: String,ischoice: Bool,myitem: [MyItem]!) {
        self.menuoption = menuoption
        self.ischoice = ischoice
        self.myitem = myitem
        if ischoice {
                    choicelabel = "필수"
                } else {
                    choicelabel = "선택"
                }
    }
    
}
