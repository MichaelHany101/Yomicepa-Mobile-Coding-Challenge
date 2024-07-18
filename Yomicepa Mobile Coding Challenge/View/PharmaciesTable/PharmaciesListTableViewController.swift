//
//  PharmaciesListTableViewController.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 18/07/2024.
//

import UIKit

class PharmaciesListTableViewController: UITableViewController {
    
    var viewModel : ViewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PharmaciesListTableViewCell.self, forCellReuseIdentifier: "pharmaciesCell")
        getPharmacies()
    }
    
    func getPharmacies() {
        viewModel.getPharmacies(url: base + pharmaciesManagement)
        //print(base + pharmaciesManagement)
        viewModel.bindPharmacies = {
            //            if let pharmacies = self.viewModel.pharmacies {
            //                print(pharmacies)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            //            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pharmacies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pharmaciesCell", for: indexPath) as! PharmaciesListTableViewCell
        cell.pharmaciesName?.text = viewModel.pharmacies[indexPath.row].doingBusinessAs
        cell.pharmaciesReturn?.text = "\(viewModel.pharmacies[indexPath.row].numberOfReturns) Return"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PharmacyInfoViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.thisPharmacy = viewModel.pharmacies[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}
