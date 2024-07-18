//
//  ViewModel.swift
//  Yomicepa Mobile Coding Challenge
//
//  Created by Michael Hany on 17/07/2024.
//

import Foundation

class ViewModel {
    var service : NetworkService = NetworkService()
    
    var bindPharmacies : (() -> ()) = {}
    var bindLogin : (() -> ()) = {}
    
    var pharmacies : [pharmacy] = [] {didSet {
        bindPharmacies()
    }}
    var logInVar : Bool = false {didSet {
        bindLogin()
    }}
    
    //MARK: - Log in Func
    func logIn(url : String, parameter : [String: Any]) {
        if let newUrl = URL(string: url){
            service.postData(url: newUrl, parameters: parameter) { (responce) in
                switch responce {
                case .success(let Data):
                    self.logInVar = true
                    if let jsonObject = Data as? [String: Any] {
                        if let token = jsonObject["token"] as? String {
                            let defaults = UserDefaults.standard
                            defaults.set(token, forKey: "token")
                            print(defaults.string(forKey: "token")!)
                        }
                    } else {
                        print("Invalid response")
                    }
                case .failure(let Error):
                    print(Error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Get Pharmacies Func
    func getPharmacies(url : String) {
        if let newUrl = URL(string: url){
            service.getData(url: newUrl) { (response: Result<[pharmacy], Error>) in
                switch response {
                case .success(let success):
                    self.pharmacies = success
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Get Pharmacy Full Details
    func getPharmacyFull(url : String) {
        if let newUrl = URL(string: url){
            service.getData(url: newUrl) { (response: Result<PharmacyInfo, Error>) in
                switch response {
                case .success(let success):
                    print(success)
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}
