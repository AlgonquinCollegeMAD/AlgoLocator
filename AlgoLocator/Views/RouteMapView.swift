import SwiftUI
import MapKit
import CoreLocation

struct RouteMapView: View {
  @EnvironmentObject var locator: LocatorModel
  @State private var route: MKRoute?
  
  var store: Store
  let request = MKDirections.Request()
  
  var destinyCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: store.lat, longitude: store.lon)
  }
  
  var startCoordinate: CLLocationCoordinate2D? {
    locator.currentLocationCoordinate2D
  }
  
  var body: some View {
    if let route = route, let startCoordinate = startCoordinate {
      Map() {
        Marker(coordinate: startCoordinate) {
          VStack {
            Image(systemName: "apps.iphone")
            Text(store.address)
          }
        }
        .tint(.blue)
        
        Marker(coordinate: destinyCoordinate) {
          VStack {
            Image(systemName: "cup.and.saucer.fill")
            Text(store.address)
          }
        }
        .tint(.green)
        
        MapPolyline(route)
          .stroke(.blue, lineWidth: 5)
      }
      .onChange(of: locator.currentLocation) {
        updateRoute()
      }
    } else {
      ProgressView() {
        Text("Loading route...")
      }
      .onAppear() {
        updateRoute()
      }
    }
  }
  
  func updateRoute() {
    guard let deviceCoordinate = locator.currentLocation?.coordinate else { return }
    route = nil
    let request = MKDirections.Request()
    request.source = MKMapItem(placemark: MKPlacemark(coordinate: deviceCoordinate))
    request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocation(latitude: store.lat, longitude: store.lon).coordinate))
    
    Task {
      let directions = MKDirections(request: request)
      let response = try? await directions.calculate()
      route = response?.routes.first
    }
  }
}
