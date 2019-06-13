//
//  ViewController.swift
//  Alert
//
//  Created by taejun seo on 21/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "FilamentOn.jpeg")
    let imgOff = UIImage(named: "FilamentOff.jpeg")
    let imgRemove = UIImage(named: "PilamentRm.png")
    
    var isLampOn = true
    
    
    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lampImg.image = imgOn
    }
    
    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn){
            let lampOnAlert = UIAlertController(title: "Alert", message: "Already On", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            lampImg.image = imgOn
            isLampOn = true
        }
    }
    
    @IBAction func btnLampOff(_ sender: UIButton) {
        if isLampOn {
            let lampOffAlert = UIAlertController(title: "off", message: "Turn off?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
                self.isLampOn=false
            })
            let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert,animated: true,completion: nil)
        }
    }
    
    @IBAction func btnLampRm(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "remove", message: "remove?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "NO, JustOff", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOff
            self.isLampOn=false
        })
        let onAction = UIAlertAction(title: "No, JustOn", style: UIAlertAction.Style.default, handler: {ACTION in self.lampImg.image = self.imgOn
            self.isLampOn=true
        })
        let removeAction = UIAlertAction(title: "Yes, Remove", style: UIAlertAction.Style.destructive, handler: {ACTION in self.lampImg.image =
            self.imgRemove
            self.isLampOn=false
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
        
    }
    
    
}

