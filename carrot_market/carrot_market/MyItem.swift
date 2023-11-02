//
//  MyItem.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/26.
//

import Foundation
import UIKit

enum MyItem: Equatable {
    case thumbnail(UIImage?,String,String, String)
    case collection(String,[CollectionViewItem])
}
enum CollectionViewItem: Equatable {
    case thumbnail(UIImage?, String, String)
}

