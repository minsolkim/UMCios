//
//  SelectTableViewCell.swift
//  delieverybasket
//
//  Created by 김민솔 on 2023/10/29.
//

import UIKit

class SelectTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {
    
    static let identifier = "SelectTableViewCell"
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.text = "메뉴"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    private let necessarylabel : UILabel = {
        let label = UILabel()
        label.text = "필수"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.backgroundColor = .blue
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    private let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    } ()
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        tableView.register(ItemCell.self, forCellReuseIdentifier: ItemCell.identifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    } ()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var selection : MyMenu?
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        self.tableView.dataSource = self
        self.tableView.delegate = self
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(necessarylabel)
        addSubview(stackView)
        addSubview(tableView)
        setLayout()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    func setLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            stackView.heightAnchor.constraint(equalToConstant: 26),
            
            necessarylabel.widthAnchor.constraint(equalToConstant: 38),
            necessarylabel.heightAnchor.constraint(equalToConstant: 26),
            
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),
            tableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
            
        ])
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.prepare(item: nil)
        tableView.reloadData()
    }
    func prepare(item: MyMenu?) {
        guard let item = item else  {
            return
        }
        self.selection = item
        nameLabel.text = item.menuoption
        necessarylabel.text = item.choicelabel
        if(item.ischoice) {
//            let lightCyan = UIColor(red: 170.0 / 255.0, green: 190.0 / 255.0, blue: 230.0 / 255.0, alpha: 0.8)
            necessarylabel.backgroundColor = UIColor(named: "buttoncolor")

            necessarylabel.textColor = .blue
        } else {
            necessarylabel.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
            necessarylabel.textColor = .darkGray
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let selectionItems = selection?.myitem else {
            return 0
        }
        return selectionItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell else {
            return UITableViewCell()
        }
//        var numberOfItems: Int = 0 {
//            didSet {
//                tableView.estimatedRowHeight = CGFloat(52 * numberOfItems)
//            }
//        }

        cell.separatorInset = UIEdgeInsets.zero
        cell.prepare(item: self.selection?.myitem[indexPath.row])
        // Set the numberOfItems for the cell
       // numberOfItems = self.selection?.myitem.count ?? 0
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
}
