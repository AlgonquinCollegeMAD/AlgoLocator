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
  
  var body: some View {
    Map() {
      Marker(store.address, coordinate: CLLocationCoordinate2D(latitude: store.lat, longitude: store.lon))
      if let route {
        MapPolyline(route)
          .stroke(.blue, lineWidth: 5)
      }
    }
    .onAppear() {
      updateRoute()
    }
    .onChange(of: locator.currentLocation) {
      updateRoute()
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
