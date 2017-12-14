//
//  ViewController.swift
//  TexasHistoricalMarkersFinalProject
//
//  Created by jbaumann on 12/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        let path = Bundle.main.path(forResource: "KML-Files/African American Markers Map.kml.xml", ofType: "kml")
        let url = URL(fileURLWithPath: path!)
        let kmlParser = GMUKMLParser(url: url)
        kmlParser.parse()
        
        let renderer = GMUGeometryRenderer(map: mapView,
                                       geometries: kmlParser.placemarks,
                                       styles: kmlParser.styles)
        
        renderer.render()
    }

}

