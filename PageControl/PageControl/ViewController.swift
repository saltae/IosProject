//
//  ViewController.swift
//  PageControl
//
//  Created by taejun seo on 24/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var images = ["IMG_0984.jpeg","IMG_0985.jpeg","IMG_0986.jpeg","IMG_0987.jpeg","IMG_0988.jpeg","IMG_0989.jpeg","IMG_0990.jpeg"]

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = images.count
        
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
    }
    @IBAction func pageChange(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    

}

