//
//  BeaconDetector.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/2/21.
//

import Foundation
import CoreLocation
import Combine



// we tell the this what beacons we are interested in, it returns a list of those beacons with the range of them
class BeaconDetector: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var lastDistance = CLProximity.unknown
    @Published var beaconDistance : CLProximity = .unknown
    
    override init(){
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        // this is a call that has to do with user permision to access privacy. I am not sure why it working at the moment
        locationManager?.requestWhenInUseAuthorization()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("auth 1")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            print("auth 2")

            guard CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) else {return beaconsWereNotGivenPermission()}
            print("auth 3")

            guard CLLocationManager.isRangingAvailable() else {return beaconsWereNotGivenPermission()}
            print("auth 4")

            startScanning()
        }else {
            beaconsWereNotGivenPermission()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if beacons.count > 0 {
            updateDistance(beacons[0].proximity)
        } else {
            updateDistance(.unknown)
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        beaconDistance = distance
    }
    
    func beaconsWereNotGivenPermission(){
        // tell the user that the game cannont continue with out allowing permissions
        print("beacons not given permisison!")
    }
    
    func startScanning() {
        print("scanning started! 1")
        let uuid = UUID(uuidString: "CC6ED3C0-477E-417B-81E1-0A62D6504061")!
        print("scanning started! 2")
        let beaconRegion = CLBeaconRegion()
        
        locationManager?.startMonitoring(for: beaconRegion)
        print("scanning started! 3")
        locationManager?.startRangingBeacons(satisfying: .init(uuid: uuid))
        print("scanning started 4")
    }
}
