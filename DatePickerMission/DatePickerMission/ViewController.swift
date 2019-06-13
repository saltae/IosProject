//
//  ViewController.swift
//  DatePickerMission
//
//  Created by taejun seo on 21/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var alarmTime :String?
    
    @IBOutlet var CurrentTime: UILabel!
    @IBOutlet var ChoosingTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func SelectPicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        alarmTime = formatter.string(from: datePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        
        
        
        ChoosingTime.text="select: " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "hh:mm aaa"
        
        let crtime = formatter.string(from: date as Date)
        if (alarmTime == crtime){
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.white
        }
        
        CurrentTime.text = "now: " + formatter.string(from: date as Date)
    }

}

