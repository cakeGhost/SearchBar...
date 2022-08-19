//
//  LocationManager.swift
//  testswiftUI_search
//
//  Created by betty on 2022/08/19.
//

import SwiftUI
import CoreLocation
import MapKit

// MARK: Combine Framework to watch Textfield Change
import Combine

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    // MARK: Properties
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    
    // MARK: Search Bar Text
    @Published var searchText: String = ""
    var cancellable: AnyCancellable?
    @Published var fetchdPlaces: [CLPlacemark]
    
    override init() {
        super.init()
        
        // MARK: Setting Delegate
        manager.delegate = self
        mapView.delegate = self
        
        // MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        
        // MARK: Search Textfield Watching
        cancellable = $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink(receiveValue: { value in
                self.fetchPlace(value: value)
            })
    }
    
    func fetchPlace(value: String) {
        // MARK: Fetching places using MKLocalSearch
        Task {
            do {
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                let response = try await MKLocalSearch(request: request).start()
                
                // We can also User Mainactor To publish changes in Main Thread
                await MainActor.run(body: {
                    self.fetchdPlaces = response.mapItems.compactMap({ itmem -> CLPlacemark? in
                        return item.placemark
                    })
                })
            }
            catch {
                // Handle Error
            }
        }
        print(value)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.last else {
            return
        }
    }
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            manager.requestLocation()
        case .authorizedWhenInUse:
            manager.requestLocation()
        case .denied:
            handleLocationError()
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        default: ()
        }
    }
    
    func handleLocationError() {
        // HANDLE ERROR
        
    }
}
