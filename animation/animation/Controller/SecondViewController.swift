//
//  SecondViewController.swift
//  animation
//
//  Created by 김민솔 on 2023/11/08.
//

import UIKit
import Lottie
import Hero
class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource  {
    let testList = Test.data
    let cellName = "CollectionViewCell"
    let cellReuseIdentifier = "testCell"

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testList.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? CollectionViewCell else {
                return UICollectionViewCell()
            }
            let target = testList[indexPath.row]
            let img = UIImage(named: "disney")
            cell.testImage?.image = img
            cell.testLabel?.text = target.title
            //cell.backgroundColor = .white
            cell.hero.modifiers = [.fade, .scale(1.5)]
            return cell
        }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var pinkView: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
            pinkView.hero.id = "pinkView"
            grayView.hero.id = "grayView"

            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: collectionView.frame.width / 3 - 5, height: collectionView.frame.width / 3 - 5)

            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = layout
            collectionView.hero.modifiers = [.cascade]
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
//            // 사용자 정의 셀을 등록합니다.
//            let nibName = UINib(nibName: cellName, bundle: nil)
//            collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
        }
    private func registerXib() {
        let nibName = UINib(nibName: cellName, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
