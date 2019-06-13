//
//  EditViewController.swift
//  Navigation
//
//  Created by taejun seo on 28/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    
}

class EditViewController: UIViewController {
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    
    
    @IBOutlet var txMessage: UILabel!
    @IBOutlet var swlsOn: UISwitch!
    
    @IBOutlet var lblWay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil
        {
            delegate?.didMessageEditDone(self, message: txMessage.text!)
                delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        _ = navigationController?.popViewController(animated: true)
        
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            self.isOn = true
        }else{
            isOn = false
            self.isOn = false
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
