//
//  GameCollectionViewCell.swift
//  UDGame
//
//  Created by Lee on 7/19/25.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet var numberButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupButton()
        backgroundColor = .clear
    }

    private func setupButton() {
        numberButton.setTitle("1", for: .normal)
        numberButton.setTitle("1", for: .selected)

        numberButton.setTitleColor(.black, for: .normal)
        numberButton.setTitleColor(.white, for: .selected)

        numberButton.backgroundColor = .white

    }

    func setupButtonTitle(index: Int) {
        let title = String(index + 1)
        numberButton.setTitle(title, for: .normal)
        numberButton.setTitle(title, for: .selected)
    }
}
