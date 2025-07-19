//
//  LogoLabel.swift
//  UDGame
//
//  Created by Lee on 7/19/25.
//

import UIKit

class TopLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        text = "UP DOWN"
        font = UIFont(name: "HiraMinProN-W6", size: 36)
        textColor = .black
    }

    func changeLabelTitle(title: String) {
        text = title
    }
}
