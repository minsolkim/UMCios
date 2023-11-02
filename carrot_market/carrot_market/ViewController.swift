//
//  ViewController.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/02.
//

import UIKit

class ViewController: UITabBarController {
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 57)) // 직사각형 모양의 크기로 수정
        button.backgroundColor = .systemOrange
        button.tintColor = .white
        button.setTitle("+글쓰기", for: .normal) // 버튼의 타이틀 설정
        button.setTitleColor(.white, for: .normal)
        // 버튼을 둥글게 만듭니다.
        button.layer.cornerRadius = 30 // 모서리를 둥글게 하는 정도 조절
        button.clipsToBounds = true
        // 쉐도우 추가
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController1 = FirstViewController()
        let navigationController1 = UINavigationController(rootViewController: viewController1)

        let viewController2 = SecondViewController()
        let navigationController2 = UINavigationController(rootViewController: viewController2)

        let viewController3 = ThirdViewController()
        let navigationController3 = UINavigationController(rootViewController: viewController3)
        
        let viewController4 = FourthViewController()
        let navigationController4 = UINavigationController(rootViewController: viewController4)
        
        let viewController5 = FifthViewController()
        let navigationController5 = UINavigationController(rootViewController: viewController5)
        viewControllers = [navigationController1, navigationController2, navigationController3, navigationController4,navigationController5]
        view.addSubview(floatingButton)
        // 버튼을 표시하도록 isHidden 속성을 false로 설정
        floatingButton.isHidden = false
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
        // TabBar 객체를 가져옵니다.
        if let tabBar = self.tabBarController?.tabBar {
                    
        let newTabBarHeight: CGFloat = 30.0 // 원하는 높이로 설정하세요.
                    
        // TabBar의 프레임을 업데이트하여 크기를 조절합니다.
        tabBar.frame.size.height = newTabBarHeight
                }
        
        // Do any additional setup after loading the view.
    }
    // 플로팅 버튼을 눌렀을 때 실행될 액션
        @objc func floatingButtonTapped() {
            // 버튼이 눌렸을 때 수행할 동작을 여기에 추가합니다.
            print("Floating button tapped!")
        }
    // 플로팅 버튼 자체의 레이아웃
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            // 버튼의 위치와 높이를 조정하여 약간 위로 이동
            let buttonYPosition = view.frame.size.height - 60 - 80 - 35 // 10은 위로 조정할 값입니다.
            floatingButton.frame = CGRect(x: view.frame.size.width - 120, y: buttonYPosition, width: 100, height: 57) // 위치와 크기 조정
        }
}
