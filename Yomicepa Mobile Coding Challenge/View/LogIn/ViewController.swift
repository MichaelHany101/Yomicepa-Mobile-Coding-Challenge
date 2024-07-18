//
//  ViewController.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 17/07/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel : ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        let parameter = ["username": "\(usernameTextField.text ?? "")", "password": "\(passwordTextField.text ?? "")"]
        viewModel.logIn(url: base + auth, parameter: parameter)
        
        viewModel.bindLogin = {
            if self.viewModel.logInVar {
                DispatchQueue.main.async {
                    let vc = PharmaciesListTableViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
}
