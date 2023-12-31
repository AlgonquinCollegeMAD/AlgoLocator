import SwiftUI
import CoreLocation

class LocatorModel: NSObject, ObservableObject {
  @Published var currentLocation: CLLocation? {
    didSet {
      guard let lat = currentLocation?.coordinate.latitude, let lon = currentLocation?.coordinate.longitude else { return }
      currentLocationCoordinate2D = CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
  }
  @Published var currentLocationCoordinate2D: CLLocationCoordinate2D?
  private var locationManager = CLLocationManager()
  
  override init() {
    super.init()
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestAlwaysAuthorization()
    
    DispatchQueue.global().async {
      if CLLocationManager.locationServicesEnabled() {
        self.locationManager.startUpdatingLocation()
      }
    }
  }
}

extension LocatorModel: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let location = locations.last?.coordinate {
      currentLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Location error: \(error.localizedDescription)")
  }
}
