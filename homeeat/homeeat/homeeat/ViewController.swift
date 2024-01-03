//
//  ViewController.swift
//  homeeat
//
//  Created by 김민솔 on 2024/01/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        constraint()
        view.backgroundColor = .black
        
        //간격을 설정할 UIBarButtonItem을 생성한다.
        
                
    }
    func constraint() {
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(button1Tapped))
        
        //이미지 크기 조정
        let image1 = UIImage(named: "back")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        // 이미지의 렌더링 모드를 .alwaysOriginal로 설정합니다.
        let backbutton = UIBarButtonItem(image: image1?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button1Tapped))
        button.tintColor = UIColor(named: "Systemcolor")
        backbutton.tintColor = UIColor(named: "Systemcolor")
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = backbutton
    }
    func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    @objc func button1Tapped() {
        // 첫 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 1 tapped")
    }

}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

