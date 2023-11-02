//
//  CustomTabBarController.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/02.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // TabBar의 높이를 설정합니다. 원하는 높이로 변경하세요.
        let newTabBarHeight: CGFloat = 60.0 // 60 포인트로 설정 예시

        // TabBar의 프레임을 업데이트하여 크기를 조절합니다.
        tabBar.frame.size.height = newTabBarHeight
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
