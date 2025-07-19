//
//  GameViewController.swift
//  UDGame
//
//  Created by Lee on 7/18/25.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var checkCollectionView: UICollectionView!

    var userNum: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        checkCollectionView.backgroundColor = .clear

        let xib = UINib(nibName: String(describing: GameCollectionViewCell.self), bundle: nil)
        checkCollectionView.register(xib, forCellWithReuseIdentifier: String(describing: GameCollectionViewCell.self))

        checkCollectionView.delegate = self
        checkCollectionView.dataSource = self
        checkCollectionView.collectionViewLayout = makeFlowLayout()
        print(userNum)
    }


}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        let deviceWidth = UIScreen.main.bounds.width

        // 셀 넓이 디바이스 넓이 - 좌우 인셋 - 아이템 간격
        let cellWidth = deviceWidth - (8 * 2) - (8 * (6 - 1))

        layout.itemSize = .init(width: cellWidth/6, height: cellWidth/6)
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 8, bottom: 0, right: 8)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8

        return layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GameCollectionViewCell.self), for: indexPath) as? GameCollectionViewCell else { return .init() }
        cell.setupButtonTitle(index: indexPath.row)
        DispatchQueue.main.async {
            cell.numberButton.layer.cornerRadius =
            cell.numberButton.frame.width / 2
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }


}
