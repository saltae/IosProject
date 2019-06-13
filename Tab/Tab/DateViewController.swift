//
//  ViewController.swift
//  DataPicker
//
//  Created by taejun seo on 21/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class DateViewController: UIViewController {
    
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime:String?
    
    @IBOutlet var lblCurrentTIme: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
        lblPickerTime.text = "select time : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
//        lblCurrentTIme.text=String(count)
//        count += 1
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        
        if(alarmTime == currentTime){
            let OnAlert = UIAlertController(title: "Alert", message: "Same Select", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            if count==0{
                OnAlert.addAction(onAction)
                present(OnAlert,animated: true,completion: nil)
                count+=1
            }else{
                count+=1
                if count==60{
                    count=0
                }
            }
            

//            if(isLampOn){
//                let lampOnAlert = UIAlertController(title: "Alert", message: "Already On", preferredStyle: UIAlertController.Style.alert)
//                let onAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
//                lampOnAlert.addAction(onAction)
//                present(lampOnAlert, animated: true, completion: nil)
//            }else{
//                lampImg.image = imgOn
//                isLampOn = true
//            }
        }
        
        lblCurrentTIme.text = "now: " + formatter.string(from: date as Date)
    }
    

}

