//
//  ViewController.swift
//  PickerView
//
//  Created by taejun seo on 21/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imgArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(component==0){
                lblImageFileName.text = imageFileName[row]
        }else{
                imageView.image = imgArray[row]
        }
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        
        return PICKER_VIEW_HEIGHT
    }
    
    let MAX_ARRAY_NUM = 7
    let PICKER_VIEW_COLUMN = 2
    var imgArray = [UIImage?]()
    var imageFileName = ["IMG_0984.jpeg","IMG_0985.jpeg","IMG_0986.jpeg","IMG_0987.jpeg","IMG_0988.jpeg","IMG_0989.jpeg","IMG_0990.jpeg"]
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    
    @IBOutlet var pickerImage: UIPickerView!
    
    @IBOutlet var lblImageFileName: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imgArray.append(image)
        }
        lblImageFileName.text = imageFileName[0]
        imageView.image = imgArray[0]
    }


}

