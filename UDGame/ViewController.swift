//
//  ViewController.swift
//  UDGame
//
//  Created by Lee on 7/18/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var logoLabel: UILabel!
    @IBOutlet var gameLabel: UILabel!

    @IBOutlet var startButton: CustomButton!

    @IBOutlet var homeImageView: UIImageView!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var numberTextFieldLine: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupGameLabel()
        setupImageView()
        setupTextField()
        setupBackground()
        setupStartButton()
    }

    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }

    private func checkInput(input: String) throws -> Int {
        if let num = Int(input) {
            return num
        } else {
            throw CustomError.inputError
        }
    }

    private func setupGameLabel() {
        gameLabel.text = "GAME"
        gameLabel.font = .systemFont(ofSize: 12)
        gameLabel.textColor = .black
    }

    private func setupImageView() {
        let images: [UIImage] = [.emotion1, .emotion2, .emotion3, .emotion4, .emotion5]
        homeImageView.image = images.randomElement()
        homeImageView.contentMode = .scaleAspectFill
    }

    private func setupTextField() {
        let holder = "숫자를 입력해주세요"
        numberTextFieldLine.backgroundColor = .white
        numberTextField.borderStyle = .none
        numberTextField.font = .boldSystemFont(ofSize: 16)
        numberTextField.textAlignment = .center
        numberTextField.placeholder = holder
    }

    private func setupStartButton() {
        startButton.setTitle("시작하기", for: .normal)
    }

    @IBAction func startButtonTapped(_ sender: CustomButton) {
        do {
            let num = try checkInput(input: numberTextField.text ?? "0")
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: String(describing: "GameViewController")) as? GameViewController else { return }
            vc.userNum = num
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            showAlert(message: CustomError.inputError.title)
        }
    }
}


enum CustomError: Error {
    case inputError

    var title: String {
        switch self {
        case .inputError: return "잘못된 입력입니다"
        }
    }
}
