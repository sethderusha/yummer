//
//  GooglePlaceController.swift
//  yummer
//
//  Created by Seth DeRusha on 7/12/24.
//

import Foundation
import CoreLocation
import GooglePlaces
import GoogleMaps

class GooglePlaceController {
    
    
    
    func initialize() {
        GMSPlacesClient.provideAPIKey("MAPS_API_KEY")
        GMSServices.provideAPIKey("MAPS_API_KEY")
    }
    
    public func getPlaces() {
        LocationService.shared.locationUpdated = { [weak self] location in
            self?.fetchPlaces(location: location)
        }
    }
    
    private func fetchPlaces(location: CLLocationCoordinate2D) {
        
    }
}
