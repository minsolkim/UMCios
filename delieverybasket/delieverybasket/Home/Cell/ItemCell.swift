//
//  ItemCell.swift
//  delieverybasket
//
//  Created by 김민솔 on 2023/10/30.
//

import UIKit

class ItemCell: UITableViewCell {
    static let identifier = "ItemCell"
    private let tapGestureRecognizer: UITapGestureRecognizer = {
            let gestureRecognizer = UITapGestureRecognizer()
            return gestureRecognizer
        }()
    private var item: MyItem? // item 변수를 클래스 내에 선언
    //imageview
    private let uncheckImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "unchecked.png")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    //itemlabel
    private let itemLabel : UILabel = {
        let label = UILabel()
        label.text = "핫소스"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //plusprice
    private let plusprice : UILabel = {
        let label = UILabel()
        label.text = "+0원"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(uncheckImage)
        addSubview(itemLabel)
        addSubview(plusprice)
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            // 이미지뷰
            uncheckImage.topAnchor.constraint(equalTo: topAnchor,constant: 12),
            uncheckImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            uncheckImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            uncheckImage.widthAnchor.constraint(equalToConstant: 30),
            uncheckImage.heightAnchor.constraint(equalToConstant: 30),
            
            // 아이템 레이블
            itemLabel.trailingAnchor.constraint(equalTo: plusprice.leadingAnchor,constant: -14),
            itemLabel.leadingAnchor.constraint(equalTo: uncheckImage.trailingAnchor, constant: 10),
            itemLabel.centerYAnchor.constraint(equalTo: uncheckImage.centerYAnchor),
            
            // 가격 레이블
            plusprice.trailingAnchor.constraint(equalTo: trailingAnchor),
            plusprice.centerYAnchor.constraint(equalTo: uncheckImage.centerYAnchor),
            
            
        ])
        // 이미지 터치를 감지하는 gesture recognizer 추가
        uncheckImage.addGestureRecognizer(tapGestureRecognizer)
        uncheckImage.isUserInteractionEnabled = true
        tapGestureRecognizer.addTarget(self, action: #selector(imageTapped))
    }
    @objc private func imageTapped() {
        // 이미지를 변경하려면 MyItem을 업데이트합니다.
        // 예를 들어, isChecked를 토글하고 이미지를 업데이트할 수 있습니다.
        if var item = item {
            item.isChecked.toggle()
            uncheckImage.image = item.image
        }
    }
    override func prepareForReuse() {
       super.prepareForReuse()
       self.prepare(item: nil)
     }
     
    func prepare(item: MyItem?) {
        guard let item = item else  {
            return
        }
        self.uncheckImage.image = item.image
        self.itemLabel.text = item.title
        self.plusprice.text = item.subtitle
     }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
