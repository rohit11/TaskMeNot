//
//  AccountViewController.swift
//  TaskMeNot
//
//  Created by Rohit Nisal on 12/23/16.
//  Copyright © 2016 Rohit Nisal. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signOut(_ sender: Any) {
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        delegate.showLoginScreen();
    }

}

