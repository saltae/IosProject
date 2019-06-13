//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by taejun seo on 04/06/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationBarDelegate, UIImagePickerControllerDelegate{
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false

    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker,animated: true,completion: nil)
            
        }
        else{
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
            
        }
    }
    
    @IBAction func btnLoadImageFromLibbrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker,animated: true,completion: nil)
            
        }else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
    }
    
    func myAlert(_ title: String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

