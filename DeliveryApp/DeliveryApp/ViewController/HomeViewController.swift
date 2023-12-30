//
//  HomeViewController.swift
//  DeliveryApp
//
//  Created by 김민솔 on 2023/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ScrollV: UIScrollView!
    
    @IBOutlet weak var SearchBarV: UIView!
    
    @IBOutlet weak var SearchBarTextField: UIView!
    @IBOutlet weak var EventBar: UIView!
    
    @IBOutlet weak var ItemBar: UIView!
    
    @IBOutlet weak var Event1bar: UIView!
    @IBOutlet weak var Event2bar: UIView!
    @IBOutlet weak var Event3bar: UIView!
    
    @IBOutlet weak var Titledelivery: UIButton!
    @IBOutlet weak var food1: UIView!
    @IBOutlet weak var food2: UIView!
    @IBOutlet weak var food3: UIView!
    @IBOutlet weak var food4: UIView!
    @IBOutlet weak var food5: UIView!
    
    @IBOutlet weak var food6: UIView!
    
    @IBOutlet weak var food7: UIView!
    
    @IBOutlet weak var food8: UIView!
    
    @IBOutlet weak var food9: UIView!
    
    @IBOutlet weak var food10: UIView!
    @IBOutlet weak var bannerCollectionV: UICollectionView!
    private var timer : Timer?
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
          static let cornerRadius = 15.0
          static let cornerWidth = 3.0
      }
    deinit {
        self.timer?.invalidate()
        self.timer = nil
    }
    var nowPage: Int = 0
    let bannerImageArray: [UIImage] = [UIImage(named: "one.jpeg")!,UIImage(named: "two.jpeg")!,UIImage(named: "three.jpeg")!,UIImage(named: "four.jpeg")!,UIImage(named: "five.jpeg")!]
    let canimation = CAAnimation()
    override func viewDidLoad() {
        super.viewDidLoad()
        control()
        controlfont() //폰트 사이즈 조정
        bannerCollectionV.delegate = self
        bannerCollectionV.dataSource = self
        bannerTimer()
    }
    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
       
       self.animateBorderGradation()
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
        //첫번째 이벤트 뷰
        Event1bar.layer.cornerRadius = 15
        //두번째 이벤트 뷰
        Event2bar.layer.cornerRadius = 15
        //세번째 이벤트 뷰
        Event3bar.layer.cornerRadius = 15
        //알뜸 한집 배달 모양 뷰 만들기
        
        ItemBar.layer.cornerRadius = 15
        
        food1.layer.cornerRadius = 20
        food2.layer.cornerRadius = 20
        food3.layer.cornerRadius = 20
        food4.layer.cornerRadius = 20
        food5.layer.cornerRadius = 20
        food6.layer.cornerRadius = 20
        food7.layer.cornerRadius = 20
        food8.layer.cornerRadius = 20
        food9.layer.cornerRadius = 20
        food10.layer.cornerRadius = 20

    }
    func controlfont() {
       let attributedStr = NSMutableAttributedString(string: Titledelivery.titleLabel?.text ?? "알뜰·한집 배달 배민1 매일 드려요 할인 쿠폰")
        // text중 알뜰·한집 배달에 해당하는 곳
        attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 19), range: ((Titledelivery.titleLabel?.text)! as NSString).range(of: "알뜰·한집 배달"))

        // text중 배민1 해당하는 곳
        attributedStr.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 13), range: ((Titledelivery.titleLabel?.text)! as NSString).range(of: "배민1"))
        // text중 매일 드려요 할인 쿠폰에 해당하는 곳
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 13), range: ((Titledelivery.titleLabel?.text)! as NSString).range(of: "매일 드려요 할인 쿠폰"))
        Titledelivery.setAttributedTitle(attributedStr, for: .normal)
        
    }
    func bannerTimer() {
    let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) {
        (Timer) in self.bannerMove()
        }
    }
    //배너 움직임
    func bannerMove() {
        //현재 페이지가 마지막 페이지일 경우
        if nowPage == bannerImageArray.count-1 {
            bannerCollectionV.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        //다음 페이지 전환
        nowPage += 1
        bannerCollectionV.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    func animateBorderGradation() {
        // 1. 경계선에만 색상을 넣기 위해서 CAShapeLayer 인스턴스 생성
          let shape = CAShapeLayer()
          shape.path = UIBezierPath(
            roundedRect: self.EventBar.bounds.insetBy(dx: Constants.cornerWidth, dy: Constants.cornerWidth),
            cornerRadius: self.EventBar.layer.cornerRadius
          ).cgPath
          shape.lineWidth = Constants.cornerWidth
          shape.cornerRadius = Constants.cornerRadius
          shape.strokeColor = UIColor.white.cgColor
          shape.fillColor = UIColor.clear.cgColor
        // 2. conic 그라데이션 효과를 주기 위해서 CAGradientLayer 인스턴스 생성 후 mask에 CAShapeLayer 대입
          let gradient = CAGradientLayer()
          gradient.frame = self.EventBar.bounds
          gradient.type = .conic
          gradient.colors = Color.gradientColors.map(\.cgColor) as [Any]
          gradient.locations = Constants.gradientLocation
          gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
          gradient.endPoint = CGPoint(x: 1, y: 1)
          gradient.mask = shape
          gradient.cornerRadius = Constants.cornerRadius
          self.EventBar.layer.addSublayer(gradient)
        // 3. 매 0.2초마다 마치 circular queue처럼 색상을 번갈아서 바뀌도록 구현
          self.timer?.invalidate()
          self.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            gradient.removeAnimation(forKey: "myAnimation")
            let previous = Color.gradientColors.map(\.cgColor)
            let last = Color.gradientColors.removeLast()
            Color.gradientColors.insert(last, at: 0)
            let lastColors = Color.gradientColors.map(\.cgColor)
            
            let colorsAnimation = CABasicAnimation(keyPath: "colors")
            colorsAnimation.fromValue = previous
            colorsAnimation.toValue = lastColors
            colorsAnimation.repeatCount = 1
            colorsAnimation.duration = 0.2
            colorsAnimation.isRemovedOnCompletion = false
            colorsAnimation.fillMode = .both
            gradient.add(colorsAnimation, forKey: "myAnimation")
          }
    }

}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionV.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = bannerImageArray[indexPath.row]
        return cell
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionV.frame.size.width  , height:  bannerCollectionV.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

