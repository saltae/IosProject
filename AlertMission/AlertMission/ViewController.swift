//
//  ViewController.swift
//  AlertMission
//
//  Created by taejun seo on 22/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblCurrnetTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    let interval = 1.0
    let timeSelector: Selector = #selector(ViewController.updateTime)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectTime.text = "select time : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        //        lblCurrentTIme.text=String(count)
        //        count += 1
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrnetTime.text = "now: " + formatter.string(from: date as Date)
    }

}

