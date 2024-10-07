//
//  ExploreView.swift
//  QuickCuts
//
//  Created by Amit Kumar Dhal on 09/09/24.
//

import SwiftUI
import MapKit


struct ExploreView: View {
    @State var cameraPosition: MapCameraPosition = .region(.userLocation)
    @State var searchText: String = ""
    @State var results: [MKMapItem] = []
    @State var mapSelection: MKMapItem? = nil
    @State var showDetails: Bool = false
    @State var routeDisplaying: Bool = false
    @State var route: MKRoute?
    @State var routeDestination: MKMapItem?
    @State var getDirection: Bool = false
    
    var body: some View {
        Map (position: $cameraPosition, selection: $mapSelection) {
            Annotation("My Location", coordinate: .userLocation) {
                ZStack {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.blue.opacity(0.25))
                    
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundColor(.blue)
                }
            }
            
            ForEach (results, id: \.self) { result in
                if routeDisplaying {
                    if result == routeDestination {
                        let placeMark = result.placemark
                        Marker(placeMark.name ?? "", coordinate: placeMark.coordinate)
                    }
                } else {
                    let placeMark = result.placemark
                    Marker(placeMark.name ?? "", coordinate: placeMark.coordinate)
                }
            }
            
            if let route {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        .mapControls{
            MapCompass()
            MapPitchToggle()
            // MapUserLocationButton()
        }
        .mapStyle(.standard(elevation: .realistic))
        .overlay (alignment: .top) {
            TextField("Search Salons", text: $searchText)
                .font(.subheadline)
                .padding(12)
                .background(Color.white)
                .cornerRadius(8)
                .padding()
                .shadow(radius: 10)
        }
        .onSubmit (of: .text) {
            Task { await searchPlaces() }
        }
        .onChange(of: getDirection, { oldValue, newValue in
            if newValue {
                fetchRoute()
            }
        })
        .onChange(of: mapSelection) { oldValue, newValue in
            showDetails = newValue != nil
        }
        .sheet(isPresented: $showDetails, content: {
            LocationDetailView(mapSelection: $mapSelection, show: $showDetails, getDirection: $getDirection)
                .presentationDetents([.height(340)])
                .presentationBackgroundInteraction(.enabled(upThrough: .height(360)))
                .presentationCornerRadius(12)
        })
    }
    
    
    func searchPlaces() async {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchText
        request.region = .userLocation
        
        let results = try? await MKLocalSearch(request: request).start()
        self.results = results?.mapItems ?? []
    }
    
    func fetchRoute() {
        if let mapSelection {
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: .userLocation))
            request.destination = mapSelection
            
            Task {
                let result = try? await MKDirections(request: request).calculate()
                route = result?.routes.first
                routeDestination = mapSelection
                
                withAnimation (.snappy) {
                    routeDisplaying = true
                    showDetails = false
                    
                    if let rect = route?.polyline.boundingMapRect, routeDisplaying {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
    }
}

extension CLLocationCoordinate2D{
    static let userLocation = CLLocationCoordinate2D(latitude: 25.77427, longitude: -80.19366)
}

extension MKCoordinateRegion {
    static var userLocation: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
            .previewDevice("iPhone 14 Pro") // You can choose your desired device
    }
}
