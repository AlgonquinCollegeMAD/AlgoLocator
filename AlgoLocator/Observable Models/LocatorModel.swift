import SwiftUI
import CoreLocation

class LocatorModel: NSObject, ObservableObject {
  @Published var currentLocation: CLLocation?
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
