//
//  MapsPin.swift
//  MusAic trial 2
//
//  Created by Varun Sampat on 22/09/18.
//  Copyright © 2018 developer. All rights reserved.
//

import MapKit
class MapsPin: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title=title
        self.subtitle=subtitle
        self.coordinate=coordinate
    }

        
    
}

