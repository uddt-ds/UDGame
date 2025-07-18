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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
    }

    private func setupNavigation() {
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: String(describing: "GameViewController"))
        navigationController?.pushViewController(vc, animated: true)
    }
}

