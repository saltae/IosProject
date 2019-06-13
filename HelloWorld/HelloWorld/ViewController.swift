//
//  ViewController.swift
//  HelloWorld
//
//  Created by taejun seo on 20/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblHello: UILabel!
    @IBOutlet var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: Any) {
        lblHello.text = "Hello, " + txtName.text!
    }
    
}

