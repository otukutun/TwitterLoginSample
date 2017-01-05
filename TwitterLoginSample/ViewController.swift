//
//  ViewController.swift
//  TwitterLoginSample
//
//  Created by otukutun on 1/4/17.
//  Copyright © 2017 otukutun. All rights reserved.
//

import UIKit
import Accounts
import Social

class ViewController: UIViewController {

    var accountStore:ACAccountStore = ACAccountStore()
    var twAccount: ACAccount?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInTwitterAccount(_ sender: Any) {
        self.selectTwitterAccount()
    }

    func selectTwitterAccount() {
        
        let accountType:ACAccountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (granted: Bool, error: Error?) -> Void in
            if error != nil {
                print("error! \(error)")
                return
            }
            
            if !granted {
                print("error! Twitterアカウントの利用が許可されていません")
                return
            }
            
            let accounts = self.accountStore.accounts(with: accountType) as! [ACAccount]
            
            if accounts.count == 0 {
                print("error! 設定画面からアカウントを設定してください")
                return
            }
            
            print("アカウント取得完了")
        }
    }
}

