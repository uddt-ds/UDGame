//
//  GameCollectionViewCell.swift
//  UDGame
//
//  Created by Lee on 7/19/25.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {

    @IBOutlet var numberBgView: UIView!
    @IBOutlet var numberLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                numberBgView.backgroundColor = .black
                numberLabel.textColor = .white
            } else {
                numberBgView.backgroundColor = .white
                numberLabel.textColor = .black
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
    }

    func setupBgView() {
        backgroundColor = .white
    }

    func setupLabelTitle(index: Int) {
        let title = String(index)
        numberLabel.text = title
    }
}
