//
//  ViewController.swift
//  yummer
//
//  Created by Seth DeRusha on 7/11/24.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserLocation()
    }
    
    private func getUserLocation() {
        LocationService.shared.locationUpdated = { [weak self] location in
            self?.fetchPlaces(location: location)
        }
    }
    
    private func fetchPlaces(location: CLLocationCoordinate2D) {
        let searchSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let searchRegion = MKCoordinateRegion(center: location, span: searchSpan)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.region = searchRegion
        searchRequest.resultTypes = .pointOfInterest
        searchRequest.naturalLanguageQuery = "Restraunts"
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, error in
            guard let mapItems = response?.mapItems else {
                    return
            }
            
            let results = mapItems.map({$0.name ?? "No Name Found"})
            print(response)
        }
    }
}

