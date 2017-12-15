//
//  ViewController.swift
//  TexasHistoricalMarkersFinalProject
//
//  Created by jbaumann on 12/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 31.23492, longitude: -99.10238, zoom: 5.5)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = self
        view = mapView
        
        let filepath = "/KML-Files/Texas Historical Markers Map.kml"
        let path = Bundle.main.path(forResource: filepath, ofType: "xml")
        let url = URL(fileURLWithPath: path!)
        let kmlParser = GMUKMLParser(url: url)
        kmlParser.parse()
        
        let renderer = GMUGeometryRenderer(map: mapView, geometries: kmlParser.placemarks, styles: kmlParser.styles)
        renderer.render()
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let markerViewController = storyboard.instantiateViewController(withIdentifier: "markerDetailViewController") as! MarkerDetailViewController
        markerViewController.configure(marker: marker)
        self.present(markerViewController, animated: true, completion: nil)
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) {
        
    }
    
}

