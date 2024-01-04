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
        navigationcontrol()
        
        
        
        
                
    }
    //네비게이션 바 설정
    func navigationcontrol() {
        view.backgroundColor = .black
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(button1Tapped))
        let backbutton = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(button1Tapped))
        
        button.tintColor = UIColor(named: "Systemcolor")
        backbutton.tintColor = UIColor(named: "Systemcolor")
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "집밥토크 글쓰기"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
        
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

