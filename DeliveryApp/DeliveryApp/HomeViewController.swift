//
//  HomeViewController.swift
//  DeliveryApp
//
//  Created by 김민솔 on 2023/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    private enum Color {
        static var gradientColors = [
          UIColor.systemBlue,
          UIColor.systemBlue.withAlphaComponent(0.7),
          UIColor.systemBlue.withAlphaComponent(0.4),
          UIColor.systemGreen.withAlphaComponent(0.3),
          UIColor.systemGreen.withAlphaComponent(0.7),
          UIColor.systemGreen.withAlphaComponent(0.3),
          UIColor.systemBlue.withAlphaComponent(0.4),
          UIColor.systemBlue.withAlphaComponent(0.7),
        ]
      }
      private enum Constants {
        static let gradientLocation = [Int](0..<Color.gradientColors.count)
          .map(Double.init)
          .map { $0 / Double(Color.gradientColors.count) }
          .map(NSNumber.init)
        static let cornerRadius = 30.0
        static let cornerWidth = 10.0
        static let viewSize = CGSize(width: 100, height: 350)
      }
    @IBOutlet weak var ScrollV: UIScrollView!
    
    @IBOutlet weak var SearchBarV: UIView!
    
    @IBOutlet weak var SearchBarTextField: UIView!
    
    @IBOutlet weak var EventBar: UIView!
    
    @IBOutlet weak var ItemBar: UIView!
    override func viewDidLoad() {
        control()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func control() {
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        //서치바 모양 뷰 만들기
        SearchBarV.backgroundColor = UIColor(red: 0.16, green: 0.76, blue: 0.74, alpha: 1.0)
        SearchBarV.layer.cornerRadius = 15
        SearchBarV.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        SearchBarTextField.layer.cornerRadius = 2
        SearchBarTextField.layer.shadowOffset = CGSize(width: 1, height: 1)
        SearchBarTextField.layer.shadowOpacity = 0.3
        SearchBarTextField.layer.shadowColor = UIColor.black.cgColor
        //이벤트 모양 뷰 만들기
        EventBar.layer.cornerRadius = 15
        EventBar.layer.borderWidth = 3
        //알뜸 한집 배달 모양 뷰 만들기
        ItemBar.layer.cornerRadius = 15
        ItemBar.layer.borderWidth = 3
        

    }

}
