//
//  UIView+Extension.swift
//  UDGame
//
//  Created by Lee on 7/19/25.
//

import UIKit

extension UIViewController {
    func setupBackground() {
        view.backgroundColor = .link
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
