//
//  ViewController.swift
//  access-checker
//
//  Created by Javier Pintor on 01/04/2020.
//  Copyright © 2020 Orange. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let keychainService = "es.orange.rightVSDK"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        readKeyChain()
    }
    
    func readKeyChain(){
        
         
         let genericPwdQueryable = GenericPasswordQueryable(service: keychainService)
         let secureStoreWithGenericPwd = SecureStore(secureStoreQueryable: genericPwdQueryable)

         var message = ""
         do {
            let user = try secureStoreWithGenericPwd.getValue(for: "username")
            message += "Username: \(user)"
            
         } catch  {
            message += " \(error)"
         }
        
        do {
            let password = try secureStoreWithGenericPwd.getValue(for: "password")
            message += "- password: \(password)"
           
        } catch  {
            message += "\(error)"
        }
        
        do {
            let householdId = try secureStoreWithGenericPwd.getValue(for: "householdId")
            message += "- householId: \(householdId)"
        } catch  {
            message += " \(error)"
        }
        
        showResults(message: message)
        
    }
    
    func showResults(message: String){
        let alert = UIAlertController(title: "Results", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true)
    }

}


