//
//  MyTableViewCellTwo.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/26.
//

import UIKit

final class MyTableViewCellTwo: UITableViewCell {
  static let id = "MyTableViewCellTwo"
  static let cellHeight = 210.0
    private let label: UILabel = {
      let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
      label.numberOfLines = 0
      label.textColor = .black
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.tintColor = .black
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionViewFlowLayout: UICollectionViewFlowLayout = {
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      layout.minimumLineSpacing = 8.0
      layout.minimumInteritemSpacing = 0
      layout.itemSize = CGSize(width: (120), height: 195)
      return layout
    }()
    lazy var collectionView: UICollectionView = {
      let view = UICollectionView(frame: .zero, collectionViewLayout: self.collectionViewFlowLayout)
      view.isScrollEnabled = true
      view.showsHorizontalScrollIndicator = false
      view.showsVerticalScrollIndicator = true
      view.contentInset = .zero
      view.backgroundColor = .clear
      view.clipsToBounds = true
      view.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.id)
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
    private var items = [CollectionViewItem]() // <-

    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.collectionView.dataSource = self // <-
        
        self.contentView.addSubview(self.label)
        self.contentView.addSubview(self.collectionView)
        self.contentView.addSubview(self.button) // Add the button to the contentView

        NSLayoutConstraint.activate([
            self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12),
            self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8), // Adjust as needed
            self.label.rightAnchor.constraint(equalTo: self.button.leftAnchor, constant: -12), // Add spacing between label and button
            ])

        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            self.button.widthAnchor.constraint(equalToConstant: 24),
            self.button.heightAnchor.constraint(equalToConstant: 24)
            ])
        NSLayoutConstraint.activate([
            self.collectionView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.label.bottomAnchor),
        ])
    }
    override func prepareForReuse() {
      super.prepareForReuse()
      self.prepare(name: nil, items: [])
    }

    func prepare(name: String?, items: [CollectionViewItem]) {
      self.label.text = name
      self.items = items
    }
    
}
extension MyTableViewCellTwo: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell

                // CollectionViewItem에서 데이터 가져오기
                let item = self.items[indexPath.item]

                switch item {
                case .thumbnail(let image, let title, let description):
                    // MyCollectionViewCell에 데이터 설정
                    cell.prepare(image: image, title: title, description: description)
                default:
                    // 다른 CollectionViewItem 케이스에 대한 처리 추가
                    break
                }
            
            return cell
        }
    }



