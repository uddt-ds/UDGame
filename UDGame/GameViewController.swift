//
//  GameViewController.swift
//  UDGame
//
//  Created by Lee on 7/18/25.
//

import UIKit

class GameViewController: UIViewController, CheckSystem {

    @IBOutlet var topLabel: TopLabel!
    @IBOutlet var checkCollectionView: UICollectionView!
    @IBOutlet var tryCountLabel: SubLabel!

    var userNum: Int = 0
    var tryCount: Int = 0
    private var answerNumber: Int = 0
    private var selectedNumber: Int = 0
    private var totalNumArr: [Int] = []
    private var isCorrect: Bool = false

    @IBOutlet var checkButton: CustomButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackground()
        setupCheckButton()

        checkCollectionView.backgroundColor = .clear

        let xib = UINib(nibName: String(describing: GameCollectionViewCell.self), bundle: nil)
        checkCollectionView.register(xib, forCellWithReuseIdentifier: String(describing: GameCollectionViewCell.self))

        checkCollectionView.delegate = self
        checkCollectionView.dataSource = self
        checkCollectionView.collectionViewLayout = makeFlowLayout()

        answerNumber = Int.random(in: 1...userNum)
        for num in 1...userNum {
            totalNumArr.append(num)
        }

        print(answerNumber)
    }

    func checkAnswer() -> Bool {
        if selectedNumber > answerNumber {
            topLabel.text = "Down"
            return false
        } else if selectedNumber < answerNumber {
            topLabel.text = "Up"
            return false
        } else {
            return true
        }
    }

    private func setupCheckButton() {
        checkButton.isEnabled = false
    }

    @IBAction func checkButtonTapped(_ sender: UIButton) {
        tryCount += 1
        tryCountLabel.text = "시도 횟수: \(tryCount)"

        isCorrect = checkAnswer()

        if isCorrect {
            navigationController?.popViewController(animated: true)
        } else {
            // 해당하는 값을 찾아서 delete
            if let index = totalNumArr.firstIndex(of: selectedNumber) {
                totalNumArr.remove(at: index)
                checkCollectionView.deleteItems(at: [IndexPath(item: index, section: 0)])
            }
        }
    }
}

extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func makeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        let deviceWidth = UIScreen.main.bounds.width

        // 셀 넓이 = 디바이스 넓이 - 좌우 인셋 - 아이템 간격
        let cellWidth = deviceWidth - (CollectionConfigure.inset * 2) - (CollectionConfigure.spacing * (CollectionConfigure.itemCount - 1))

        layout.itemSize = .init(width: cellWidth/CollectionConfigure.itemCount,
                                height: cellWidth/CollectionConfigure.itemCount)
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: CollectionConfigure.inset, bottom: 0, right: CollectionConfigure.inset)
        layout.minimumInteritemSpacing = CollectionConfigure.spacing
        layout.minimumLineSpacing = CollectionConfigure.spacing

        return layout
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalNumArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GameCollectionViewCell.self), for: indexPath) as? GameCollectionViewCell else { return .init() }
        cell.setupLabelTitle(index: totalNumArr[indexPath.item])
        DispatchQueue.main.async {
            cell.numberBgView.layer.cornerRadius =
            cell.numberBgView.frame.width / 2
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedNumber = totalNumArr[indexPath.item]

        checkButton.isEnabled = true
    }
}
