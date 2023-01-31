//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Mohamed Melek Chtourou on 30/1/2023.
//

import Foundation
import MapKit

extension ContentView{
    @MainActor class ViewModel : ObservableObject{
        
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations = [Location]()
        @Published var seletecPlace : Location?


        func addLocation() {
            locations.append(Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude:mapRegion.center.longitude))
        }
        
        func update(location:Location){
            guard let selectedPlace = seletecPlace else {return}
            if let index = locations.firstIndex(of: selectedPlace){
                locations[index] = location
            }
        }
    }
}
