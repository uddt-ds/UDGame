//
//  CustomButton.swift
//  UpdownGame
//
//  Created by Lee on 7/18/25.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        setupButtonTitle(title: "테스트")
    }

    private func setupButton() {
        backgroundColor = .black
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 12)
    }

    func setupButtonTitle(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
    }
}
