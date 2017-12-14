//
//  AppDelegate.swift
//  TexasHistoricalMarkersFinalProject
//
//  Created by jbaumann on 12/14/17.
//  Copyright © 2017 jbaumann. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyAcRQleosLD21I8hJhEuRfnPDEZ1KrfFZE")
        GMSPlacesClient.provideAPIKey("AIzaSyAcRQleosLD21I8hJhEuRfnPDEZ1KrfFZE")
        return true
    }
    
}

