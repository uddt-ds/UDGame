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
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .clear
    }

    func setupBgView() {
        backgroundColor = .white
    }

    func setupLabelTitle(index: Int) {
        let title = String(index + 1)
        numberLabel.text = title
    }
}
