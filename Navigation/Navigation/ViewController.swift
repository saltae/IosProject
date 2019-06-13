//
//  ViewController.swift
//  Navigation
//
//  Created by taejun seo on 28/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        <#code#>
    }
    
    
    let imgOn = UIImage(named: "FilamentOn.jpeg")
    let imgOff = UIImage(named: "FilamentOff.jpeg")
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    @IBOutlet var txMessage: UITextField!
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"
        {
            editViewController.textWayValue = "segue : use button"
        }
        else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.textMessage = txMessage.text!
        editViewController.delegate = self
        
    }
}

