//
//  MyTableViewCellOne.swift
//  carrot_market
//
//  Created by 김민솔 on 2023/10/26.
//

import UIKit

final class MyTableViewCellOne: UITableViewCell {
    static let id = "MyTableViewCellOne"
    private let thumbnailImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10 // 둥근 모서리 반경 조절
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 18)
            label.numberOfLines = 0
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    private let subtitleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .gray
            label.font = .systemFont(ofSize: 15)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    private let descriptionLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        NSLayoutConstraint.activate([
                   contentView.heightAnchor.constraint(equalToConstant: 140)
               ])
               
               let horizontalStackView = UIStackView()
               horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
               horizontalStackView.axis = .horizontal
               horizontalStackView.spacing = 8 // Adjust as needed

               // Create labels stack view (titleLabel and subtitleLabel)
               let labelsStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, descriptionLabel])
               labelsStackView.axis = .vertical
               labelsStackView.spacing = 3

               // Add thumbnailImageView, labelsStackView, and descriptionLabel to the horizontal stack view
               horizontalStackView.addArrangedSubview(thumbnailImageView)
               horizontalStackView.addArrangedSubview(labelsStackView)
               //horizontalStackView.addArrangedSubview(descriptionLabel)

               contentView.addSubview(horizontalStackView)

        NSLayoutConstraint.activate([
                   thumbnailImageView.widthAnchor.constraint(equalToConstant: 120),
                   thumbnailImageView.heightAnchor.constraint(equalToConstant: 120),
                   horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                   horizontalStackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor),
                   horizontalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor),
                   horizontalStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                   horizontalStackView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor),
               ])
    }
    
    override func prepareForReuse() {
       super.prepareForReuse()
       self.prepare(image: nil, title: nil, subtitle: nil, description: nil)
     }
     
     func prepare(image: UIImage?, title: String?, subtitle: String?, description: String?) {
       self.thumbnailImageView.image = image
       self.titleLabel.text = title
       self.subtitleLabel.text = subtitle
       self.descriptionLabel.text = description
     }
}

