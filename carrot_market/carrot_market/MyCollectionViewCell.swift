//
//  MyCollectionViewCell.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/26.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let id = "MyCollectionViewCell"

        private let imageView: UIImageView = {
            let view = UIImageView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private let titleLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

        private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 12)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
                    imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
                    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    imageView.heightAnchor.constraint(equalToConstant: 125),
                    
                    titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
                    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                    
                    descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
                    descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
                ])
        self.imageView.layer.cornerRadius = 8
        self.imageView.clipsToBounds = true

      }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 셀의 내용을 설정하는 메서드
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(image: nil, title: nil, description: nil)
      }
    func prepare(image: UIImage?, title: String?,description: String?) {
      self.imageView.image = image
      self.titleLabel.text = title
      self.descriptionLabel.text = description
    }
}

