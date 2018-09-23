//
//  ViewController.swift
//  MusAic trial 2
//
//  Created by Varun Sampat on 22/09/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit
import MapKit
import CoreGraphics

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}



class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var LeadingC: NSLayoutConstraint!
    
    var locLatitude = [43.656317, 43.646685, 43.641594, 43.652484]
    var locLongitude = [-79.380914, -79.395745, -79.388947, -79.398189]
    var locDots = [10, 4, 8, 7]
    var locRadius = [7, 5, 9, 3]

    var menuIsVisible = false
    
    @IBAction func menuBtnTapped(_ sender: Any) {
        if !menuIsVisible {
            LeadingC.constant = 150
            trailingC.constant = 0
            menuIsVisible = true
        }
        else {
            LeadingC.constant = 0
            trailingC.constant = 0
            menuIsVisible = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: { self.view.layoutIfNeeded()
        })
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        /*let distanceSpan:CLLocationDegrees = 5000
        let currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(43.6532, -79.3832)
        mapView.setRegion(MKCoordinateRegion(center: currentLocation, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan), animated: true)
        let actualPin = MapsPin(title: "You are here right now", subtitle: "Subtitle", coordinate: currentLocation)
        mapView.addAnnotation(actualPin)*/
        
        for i in 0...(locLatitude.count-1){
            var location = CLLocationCoordinate2D(latitude: locLatitude[i], longitude:locLongitude[i])
            var region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
            self.mapView.setRegion(region, animated: true)
            
            var pin = customPin(pinTitle: "*Insert Event Name*", pinSubTitle: "* Insert Address*", location: location)
            self.mapView.addAnnotation(pin)
            self.mapView.delegate = self
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customannotation")
        annotationView.image = UIImage(named:"pin")
        annotationView.canShowCallout = true
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("annotation title == \(String(describing: view.annotation?.title!))")
    }



}

