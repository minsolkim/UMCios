//
//  FifthViewController.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/02.
//

import UIKit

class FifthViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.tintColor = UIColor.black
        self.tabBar.barTintColor = UIColor.white // 원하는 배경색으로 설정
            let originalImage = UIImage(named: "user") // 이미지 이름으로 이미지를 로드합니다.
            // 선택된 이미지 생성 (검정색 필터 적용)
            let resizedImage = resizeImage(image: originalImage, targetSize: CGSize(width: 20, height: 20)) // 원하는 크기로 리사이즈합니다.
            // 검정색 배경을 가진 이미지를 선택된 상태 이미지로 설정
            let tabBarItem = UITabBarItem(
                title: "나의 당근",
                image: resizedImage,
                selectedImage: nil
            )
            // 뷰의 배경색을 흰색으로 설정
            self.view.backgroundColor = UIColor.white
            // 이미지와 타이틀의 위치 조정
            tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -3, right: 0) // 이미지를 아래로 이동
                    self.tabBarItem = tabBarItem

            // Do any additional setup after loading the view.
        
        func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
            guard let image = image else {
                return nil
            }
            
            let renderer = UIGraphicsImageRenderer(size: targetSize)
            return renderer.image { (context) in
                image.draw(in: CGRect(origin: .zero, size: targetSize))
            }
        }
        // Do any additional setup after loading the view.
    }

}
