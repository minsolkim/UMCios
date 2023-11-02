//
//  FirstViewController.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/02.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    private let tableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.backgroundColor = .white
//        view.separatorStyle = .none
//        view.bounces = true
        view.showsVerticalScrollIndicator = true
        view.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        view.register(MyTableViewCellOne.self, forCellReuseIdentifier: MyTableViewCellOne.id)
        view.register(MyTableViewCellTwo.self, forCellReuseIdentifier: MyTableViewCellTwo.id)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()

    var items: [MyItem] = [
        .thumbnail(UIImage(named: "tab1"), "[급구] 50만원 제공! 쿵야 레스토랑에서 시식 알바 구함니다.^^-", "당근알바 . 이벤트", ""),
        .thumbnail(UIImage(named: "tab2"), "에어팟맥스실버", "서울특별시 양천구", "370,000원"),
        .collection("시원한 여름간식의 계절🍉🍧🍦",
                    [.thumbnail(UIImage(named: "image1"), "키친플라워 DW1201CP", "620,00원"),
                     .thumbnail(UIImage(named: "image2"), "얼름트레이 소 (얼음판)/개당판매", "1,000원"),
                     .thumbnail(UIImage(named: "image3"), "실리콘얼음틀", "2,000원"),
                     .thumbnail(UIImage(named: "image4"), "춘식이얼음틀", "2,000원")
                                    ]),
        .thumbnail(UIImage(named: "tab3"), "에어팟맥스 실버(미개봉) ", "서울특별시 구로구", "600,000원"),
        .thumbnail(UIImage(named:"tab5"), "메가하이볼", "광명동 . 추천소식", ""),
        .thumbnail(UIImage(named: "tab4"),"에어팟스","경기도 이천시","5000원")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        NSLayoutConstraint.activate([
              self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
              self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
              self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
              self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            ])
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // 네비게이션 바의 버튼을 만듭니다.
        // 오른쪽 끝에 "내 위치" 버튼을 생성합니다.
        let button = UIBarButtonItem(title: "내 위치", style: .plain, target: self, action: #selector(buttonTapped))
        // 버튼의 텍스트 색상을 검정색으로 설정합니다.
        button.tintColor = .black
        // 네비게이션 바의 오른쪽 끝에 버튼을 설정합니다.
        navigationItem.leftBarButtonItem = button

        // 왼쪽 버튼들을 생성합니다.
        // 이미지 크기를 조정합니다.
        let image1 = UIImage(named: "bell")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image2 = UIImage(named: "loupe")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image3 = UIImage(named: "more")?.resizeImage(targetSize: CGSize(width: 25, height: 25))

        // 이미지의 렌더링 모드를 .alwaysOriginal로 설정합니다.
        let button1 = UIBarButtonItem(image: image1?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button1Tapped))
        let button2 = UIBarButtonItem(image: image2?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button2Tapped))
        let button3 = UIBarButtonItem(image: image3?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button3Tapped))

        button1.tintColor = .black
        button2.tintColor = .black
        button3.tintColor = .black

        // 간격을 설정할 UIBarButtonItem을 생성합니다.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0 // 간격 너비 조정

        // 오른쪽 버튼들과 간격을 배열로 설정합니다.
        navigationItem.rightBarButtonItems = [button1, flexibleSpace, button2, flexibleSpace, button3]

        // TabBar 객체를 가져옵니다.
        self.tabBarController?.tabBar.tintColor = .label
        //self.tabBar.barTintColor = UIColor.white // 원하는 배경색으로 설정
        let originalImage = UIImage(named: "home") // 이미지 이름으로 이미지를 로드합니다.
        // 선택된 이미지 생성 (검정색 필터 적용)
        let resizedImage = resizeImage(image: originalImage, targetSize: CGSize(width: 20, height: 20)) // 원하는 크기로 리사이즈합니다.

        // 탭바 아이템의 색상 설정 (선택되지 않은 상태)
        let normalAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        UITabBarItem.appearance().setTitleTextAttributes(normalAttributes, for: .normal)

        // 탭바 아이템의 색상 설정 (선택된 상태)
        let selectedAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black]
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, for: .selected)

        let tabBarItem = UITabBarItem(
            title: "홈",
            image: resizedImage,
            selectedImage: nil
        )
        tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -3, right: 0) // 이미지를 아래로 이동
        self.tabBarItem = tabBarItem
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      switch self.items[indexPath.item] {
      case .thumbnail:
        return UITableView.automaticDimension
      case .collection:
        return MyTableViewCellTwo.cellHeight
      }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.items[indexPath.row] {
        case let .thumbnail(image, title, subtitle, description):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellOne.id, for: indexPath) as! MyTableViewCellOne
            cell.prepare(image: image, title: title, subtitle: subtitle, description: description)
            return cell
        case let .collection(name, items):
            let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCellTwo.id, for: indexPath) as! MyTableViewCellTwo
            cell.prepare(name: name, items: items)
            return cell
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

    @objc func button2Tapped() {
        // 두 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 2 tapped")
    }

    @objc func button3Tapped() {
        // 세 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 3 tapped")
    }

    @objc func buttonTapped() {
        // 버튼이 탭되었을 때 실행되는 코드
        print("내 위치 버튼이 탭되었습니다.")
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

