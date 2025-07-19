//
//  LogoLabel.swift
//  UDGame
//
//  Created by Lee on 7/19/25.
//

import UIKit

class SubLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLabel()
    }

    private func setupLabel() {
        text = "시도 횟수: 0"
        font = .boldSystemFont(ofSize: 14)
        textColor = .black
    }

    func changeLabelTitle(title: String) {
        text = title
    }
}
