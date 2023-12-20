//
//  AirInfo.swift
//  finedustAPI
//
//  Created by 김민솔 on 2023/12/20.
//

import Foundation
import UIKit

struct AirInfo {
    var grade: String
    var gradeToString: String
    var value: String
    var backgroundColor: UIColor
    var gradedic: [String] = ["좋음","보통","나쁨","매우나쁨"]
    
//    init(grade:String, value: String) {
//        self.grade = grade
//        self.gradeToString = gradedic[(Int(grade) ?? 3) - 1]
//        self.value = value
//        
//    }
                                
}
