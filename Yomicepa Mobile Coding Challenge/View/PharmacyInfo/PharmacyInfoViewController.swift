//
//  PharmacyInfoViewController.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import UIKit

class PharmacyInfoViewController: UIViewController {

    var thisPharmacy : pharmacy?
    
    var viewModel : ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getPharmacies(url: base + "\(thisPharmacy?.pharmacyId ?? 201)" + pharmaciesFull)
        viewModel.bindPharmacies = {
//            if let pharmacies = self.viewModel.pharmacies {
//                print(pharmacies)
//            }
        }
        // Do any additional setup after loading the view.
    }
    
}
