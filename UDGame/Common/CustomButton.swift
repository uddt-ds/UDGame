//
//  CustomButton.swift
//  UpdownGame
//
//  Created by Lee on 7/18/25.
//

import UIKit

class CustomButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = .black
                setTitleColor(.white, for: .normal)
            } else {
                backgroundColor = .gray
                setTitleColor(.white, for: .disabled)
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
        setupButtonTitle(title: "결과 확인하기")
    }

    private func setupButton() {
        backgroundColor = .black
        titleLabel?.font = .boldSystemFont(ofSize: 14)
    }

    func setupButtonTitle(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 14)
    }
}
