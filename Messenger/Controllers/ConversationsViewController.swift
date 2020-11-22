//
//  ViewController.swift
//  Messenger
//
//  Created by Alizée Gillouaye on 21/11/2020.
//

import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .red
        
       //DatabaseManager.shared.userExists(with: <#T##String#>, completion: <#T##((Bool) -> Void)##((Bool) -> Void)##(Bool) -> Void#>)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        validateAuth()
    }
    
    func validateAuth(){
        
        if FirebaseAuth.Auth.auth().currentUser == nil  {
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: false)
        }
    }

}

