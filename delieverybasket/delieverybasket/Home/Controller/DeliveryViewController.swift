//
//  DeliveryViewController.swift
//  delieverybasket
//
//  Created by 김민솔 on 2023/10/29.
//

import UIKit

class DeliveryViewController: UIViewController {
    var selections1: [MyItem] = [] // 첫 번째 섹션 데이터 배열
    var selections2: [MyItem] = [] // 두 번째 섹션 데이터 배열
    var selections3: [MyItem] = [] // 세 번째 섹션 데이터 배열
    var selections4: [MyItem] = [] // 네 번째 섹션 데이터 배열
    var selections: [MyMenu] = []
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private let homeView : UIView = {
        let homeView = UIView()
        homeView.backgroundColor = UIColor(named: "backgroundcolor")
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    private let ImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizzaimage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        } ()
    private let subView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    private let titleLabel : UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "")
        let fontSize = UIFont.boldSystemFont(ofSize: 25)
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "popular")
        imageAttachment.bounds = CGRect(x: 0, y: -12, width: 43, height: 43)
        let title = "슈퍼디럭스 L"
        let attributes : [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font : fontSize
        ]
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: title,attributes: attributes))
        label.attributedText = attributedString
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        let labelText = "쇠고기,페퍼로니,햄,버섯,피망,양파,올리브 등 가장 많은 토핑이 들어가 풍부한 맛을 내는 피자 무난한 맛으로 누구에게나 사랑받는 기본메뉴"
        label.textColor = UIColor.secondaryLabel
        let attributedString = NSMutableAttributedString(string: labelText)
        let paragraphStyle = NSMutableParagraphStyle()
        //문단사이간격
        paragraphStyle.lineSpacing = 4
        attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, labelText.count))
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //리뷰 이미지
    private let talkingReview : UIImageView = {
        let reviewIcon = UIImageView()
        reviewIcon.image = UIImage(named: "talking")
        reviewIcon.contentMode = .scaleAspectFit
        reviewIcon.translatesAutoresizingMaskIntoConstraints = false
        return reviewIcon
    }()
    //메뉴 리뷰
    private let reviewbutton : UIButton = {
        let reviewbutton = UIButton()
        reviewbutton.setTitle("메뉴 리뷰 2개", for: .normal)
        reviewbutton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        reviewbutton.setTitleColor(.black, for: .normal)
        reviewbutton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        reviewbutton.semanticContentAttribute = .forceRightToLeft
        reviewbutton.contentVerticalAlignment = .center
        reviewbutton.contentHorizontalAlignment = .center
        reviewbutton.tintColor = .black
        reviewbutton.translatesAutoresizingMaskIntoConstraints = false
        return reviewbutton
    }()
    //가격
    private let priceLabel : UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.boldSystemFont(ofSize: 22)
        priceLabel.text = "가격"
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        return priceLabel
    } ()
    //28,900원
    private let price : UILabel = {
        let price = UILabel()
        price.font = UIFont.boldSystemFont(ofSize: 22)
        price.text = "28,900원"
        price.translatesAutoresizingMaskIntoConstraints = false
        return price
    } ()
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,style:.plain)
        tableView.isScrollEnabled = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.register(SelectTableViewCell.self, forCellReuseIdentifier: SelectTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    } ()
    //하단뷰
    private let BottomView: UIView = {
        let BottomView = UIView()
        BottomView.backgroundColor = .white
        BottomView.layer.borderWidth = 1
        BottomView.layer.borderColor =  UIColor.gray.cgColor
        BottomView.translatesAutoresizingMaskIntoConstraints = false
        return BottomView
    } ()
    private let Priceminimum : UILabel = {
        let minimumlabel = UILabel()
        let priceLabel = UILabel()
        
        minimumlabel.numberOfLines = 0
        priceLabel.numberOfLines = 0
        priceLabel.text = "배달최소주문금액 \n21,900원"
        priceLabel.textColor = UIColor.darkGray
        let attributedString = NSMutableAttributedString(string: priceLabel.text!)
        // 배달최소주문금액에 대한 스타일
        let minimumAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
            NSAttributedString.Key.foregroundColor : UIColor.darkGray
        ]
        let minimumRange = (priceLabel.text! as NSString).range(of: "배달최소주문금액")
        attributedString.addAttributes(minimumAttributes, range: minimumRange)

        // 21,900원에 대한 스타일
        let priceAttributes: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.black
        ]
        let priceRange = (priceLabel.text! as NSString).range(of: "21,900원")
        attributedString.addAttributes(priceAttributes, range: priceRange)

        minimumlabel.attributedText = attributedString
        minimumlabel.sizeToFit()
        minimumlabel.translatesAutoresizingMaskIntoConstraints = false
        return minimumlabel
    } ()
    //민트버튼
    private let addCartBtn : UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemMint
        button.tintColor = .white
        button.setTitle("28,900원 담기", for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationbar()
        //기본제공 품목
        selections1.append(contentsOf: [
            MyItem(title: "핫소스(1개)", subtitle: "+0원",isChoice: false,isChecked: false),
            MyItem(title: "갈릭디핑소스", subtitle: "+0원",isChoice: false,isChecked: false),
            MyItem(title: "우리 피클", subtitle: "+0원",isChoice: false,isChecked: false),
            
        ])
        //도우 선택 , 필수
        selections2.append(contentsOf: [
            MyItem(title: "오리지널 도우", subtitle: "+0원",isChoice: true,isChecked: true),
            MyItem(title: "나폴리 도우", subtitle: "+0원",isChoice: true,isChecked: false),
            MyItem(title: "씬 도우", subtitle: "+0원",isChoice: true,isChecked: false),
            MyItem(title: "오리지널 슈퍼시드 화이버 함유 도우", subtitle: "+3000원",isChoice: true,isChecked: false),
        ])
        //사이드
        selections3.append(contentsOf: [
            MyItem(title: "맥앤치즈 볼", subtitle: "+6,900원",isChoice: false,isChecked: false),
            MyItem(title: "불고기 대파 크림치즈 파스타 ", subtitle: "+6,900원",isChoice: false,isChecked: false),
            MyItem(title: "체다 치킨 치즈 ", subtitle: "+9,800원",isChoice: false,isChecked: false),
            MyItem(title: "웨스턴 핫 윙 ", subtitle: "+9,800원",isChoice: false,isChecked: false),
        ])
        //음료 
        selections4.append(contentsOf: [
            MyItem(title: "코가콜라 1.25L", subtitle: "+2,300원",isChoice: false,isChecked: false),
            MyItem(title: "코가콜라 500ml", subtitle: "+1,700원",isChoice: false,isChecked: false),
            MyItem(title: "코가콜라 제로 1.25L", subtitle: "+2,300원",isChoice: false,isChecked: false),
            MyItem(title: "코가콜라 제로 500ml", subtitle: "+1,700원",isChoice: false,isChecked: false),
        ])
        selections.append(contentsOf: [
            MyMenu(menuoption: "기본제공품목", ischoice: false, myitem: selections1),
            MyMenu(menuoption: "도우선택", ischoice: true, myitem: selections2),
            MyMenu(menuoption: "사이드디시", ischoice: false, myitem: selections3),
            MyMenu(menuoption: "음료", ischoice: false, myitem: selections4)
        ])
        [scrollView,BottomView].forEach {
            view.addSubview($0)}
        tableView.dataSource  = self
        tableView.delegate = self
        scrollView.addSubview(homeView)
        BottomView.addSubview(Priceminimum)
        BottomView.addSubview(addCartBtn)
        // Add titleLabel to subView
        subView.addSubview(titleLabel)
        // Add descriptionLabel to subView
        subView.addSubview(descriptionLabel)
        // Add talkingReview to subView
        subView.addSubview(talkingReview)
        // Add reviewButton to subView
        subView.addSubview(reviewbutton)
        // Add priceLabel to subView
        subView.addSubview(priceLabel)
        // Add price to subView
        subView.addSubview(price)
        [ImageView,subView,tableView].forEach{
            homeView.addSubview($0)
        }
        setupLayout()
        tableView.reloadData()
    }
    func setupLayout() {
        let safe = view.safeAreaLayoutGuide
        // Configure constraints for layout
                NSLayoutConstraint.activate([
        // 스크롤 뷰에 대한 레이아웃 제약 설정
        scrollView.topAnchor.constraint(equalTo: view.topAnchor),
        scrollView.leadingAnchor.constraint(equalTo: safe.leadingAnchor),
        scrollView.trailingAnchor.constraint(equalTo: safe.trailingAnchor),
        scrollView.bottomAnchor.constraint(equalTo: safe.bottomAnchor),
            ])

        let contentLayoutGuide = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
        homeView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
        homeView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
        homeView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
        homeView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
        homeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        //homeview의 높이가 동적으로 변하게 해놓는다.
        let homeViewHeight = homeView.heightAnchor.constraint(equalTo: view.heightAnchor)
        homeViewHeight.priority = .defaultLow // 우선순위를 낮게 둠
        homeViewHeight.isActive = true
        NSLayoutConstraint.activate([
        // 내부 요소들에 대한 레이아웃 제약 설정
        ImageView.topAnchor.constraint(equalTo: homeView.topAnchor),
        ImageView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor),
        ImageView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
        ImageView.heightAnchor.constraint(equalToConstant: 200),
        ImageView.widthAnchor.constraint(equalTo: homeView.widthAnchor),
        ])
        NSLayoutConstraint.activate([
        subView.topAnchor.constraint(equalTo: ImageView.bottomAnchor,constant: -4),
        subView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor),
        subView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
        subView.heightAnchor.constraint(equalToConstant: 210),
        ])
        NSLayoutConstraint.activate([
        titleLabel.topAnchor.constraint(equalTo: subView.topAnchor,constant: 10),
        titleLabel.leadingAnchor.constraint(equalTo: subView.leadingAnchor,constant: 10),
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
        descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 10),
        descriptionLabel.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -10),
        
        talkingReview.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
        talkingReview.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 10),
        talkingReview.trailingAnchor.constraint(equalTo: reviewbutton.leadingAnchor, constant: -10),
        
        reviewbutton.centerYAnchor.constraint(equalTo: talkingReview.centerYAnchor),
        reviewbutton.leadingAnchor.constraint(equalTo: talkingReview.trailingAnchor, constant: 10),
        
        // priceLabel 수평 제약 설정
        priceLabel.topAnchor.constraint(equalTo: talkingReview.bottomAnchor, constant: 12),
        priceLabel.leadingAnchor.constraint(equalTo: homeView.leadingAnchor, constant: 12),

        // price 수평 제약 설정
        price.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
        price.trailingAnchor.constraint(equalTo: homeView.trailingAnchor, constant: -12), // 오른쪽 끝으로 배치

        tableView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 15),
        tableView.leadingAnchor.constraint(equalTo: homeView.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: homeView.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: homeView.bottomAnchor),
        
        BottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        BottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        BottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        BottomView.widthAnchor.constraint(equalTo: view.widthAnchor),
        BottomView.heightAnchor.constraint(equalToConstant: view.bounds.height / 11),
                
        // Priceminimum의 제약 설정
        Priceminimum.topAnchor.constraint(equalTo: BottomView.topAnchor, constant: 8),
        Priceminimum.leadingAnchor.constraint(equalTo: BottomView.leadingAnchor, constant: 12),
        Priceminimum.bottomAnchor.constraint(equalTo: BottomView.bottomAnchor, constant: -20),

        // addCartBtn를 Priceminimum의 왼쪽에 배치
        addCartBtn.centerYAnchor.constraint(equalTo: Priceminimum.centerYAnchor),
        addCartBtn.leadingAnchor.constraint(equalTo: Priceminimum.trailingAnchor, constant: 12), // Priceminimum의 trailing에 10 포인트 간격으로 배치

        addCartBtn.widthAnchor.constraint(equalToConstant: 250)
        
                ])
        
    }
    func navigationbar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.barTintColor = .clear
        navigationItem.setHidesBackButton(true, animated: true)
        view.backgroundColor = .white
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: nil, action: nil)
        leftButton.tintColor = .black
        leftButton.title = "슈퍼디럭스L"
        navigationItem.leftBarButtonItem = leftButton
        
        // 이미지 크기를 조정합니다.
        let image1 = UIImage(named: "home")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image2 = UIImage(named: "share")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        let image3 = UIImage(named: "carts")?.resizeImage(targetSize: CGSize(width: 25, height: 25))
        
        let button1 = UIBarButtonItem(image: image1?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button1Tapped))
        let button2 = UIBarButtonItem(image: image2?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(button2Tapped))
        let button3 = UIBarButtonItem(image: image3?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(CartViewController))

        button1.tintColor = .black
        button2.tintColor = .black
        button3.tintColor = .black
        // 간격을 설정할 UIBarButtonItem을 생성합니다.
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0 // 간격 너비 조정
        // 오른쪽 버튼들과 간격을 배열로 설정합니다.
        navigationItem.rightBarButtonItems = [button1, flexibleSpace, button2, flexibleSpace, button3]
        //navigationItem.rightBarButtonItems = [button1, button2, button3]
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
    @objc func CartViewController() {
        //장바구니로 이동
//        let cart = CartViewController()
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
extension DeliveryViewController: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selections.count
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
                cell.selectionStyle = .none
        cell.separatorInset = UIEdgeInsets.zero //구분선 없게하기
        cell.prepare(item: selections[indexPath.row])
                return cell
    }
}
extension DeliveryViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let menu = selections[indexPath.row]
//
//        // Calculate the cell height based on the number of items in the current section.
//        let itemsCount = menu.myitem.count
//
//        // You can also add some additional padding or fixed height if needed.
//        let additionalHeight: CGFloat = 48 // Adjust this value as needed.
//
//        // Calculate the total cell height for this section.
//        let cellHeight = CGFloat(itemsCount * 44) + additionalHeight
//        return cellHeight
            return UITableView.automaticDimension
    }
}
