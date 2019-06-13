//
//  ViewController.swift
//  MapView
//
//  Created by taejun seo on 22/05/2019.
//  Copyright © 2019 Xellos. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var lblLocationInfo1: UILabel!
    @IBOutlet var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latituedVaue: CLLocationDegrees,longitudeValue: CLLocationDegrees,
                    delta span : Double)-> CLLocationCoordinate2D{
        let pLocation = CLLocationCoordinate2DMake(latituedVaue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span,longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation,span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees,
                       longitudeValue: CLLocationDegrees, delta span :Double,title strTitle:
        String, subtitle strSubTitle:String) -> Void {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latituedVaue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubTitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]){
        let pLocation = locations.last
        _ = goLocation(latituedVaue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {(placemarks,Error)->Void in
            let pm=placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            self.lblLocationInfo1.text = "Now "
            self.lblLocationInfo2.text = address
        })
    }
    
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.lblLocationInfo1.text=""
            self.lblLocationInfo2.text=""
            locationManager.startUpdatingLocation()
            
        }else if sender.selectedSegmentIndex == 1{
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.8760574000004, delta: 1, title: "politac", subtitle: "kangwon")
            self.lblLocationInfo1.text="Now"
            self.lblLocationInfo2.text="kangwon"
            
        }else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latitudeValue: 37.751853, longitudeValue: 128.8760574000004, delta: 1, title: "politac", subtitle: "kangwon")
            self.lblLocationInfo1.text="Now"
            self.lblLocationInfo2.text="kangwon"
            
        }
    }
    
}

