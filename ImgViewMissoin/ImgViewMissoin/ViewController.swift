//
//  ViewController.swift
//  ImgViewMissoin
//
//  Created by taejun seo on 20/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnPre: UIButton!
    @IBOutlet var btnNext: UIButton!
    var imgName=["IMG_0984.jpeg","IMG_0985.jpeg","IMG_0986.jpeg","IMG_0987.jpeg","IMG_0988.jpeg","IMG_0989.jpeg"]
    var currentImg:Int = 0
    var imgCurrent: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgCurrent = UIImage(named: imgName[0])
    }

    @IBAction func btnPreAction(_ sender: Any) {
        imgCurrent = UIImage(named: imgName[(currentImg+1)%6])
        imgView.image = imgCurrent
        
    }
    @IBAction func btnNextAction(_ sender: Any) {
        if currentImg == 0{
            currentImg=5
        }else{
            currentImg-=1
        }
        imgCurrent = UIImage(named: imgName[currentImg])
        imgView.image = imgCurrent
    }
    
}

