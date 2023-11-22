import SwiftUI
import MapKit

struct StoreMapView: View {
  @EnvironmentObject var model: StoreLocatorModel
  
  var body: some View {
    Map {
      ForEach(model.stores, id:\.id) { store in
        Marker(
          store.address,
          coordinate: CLLocationCoordinate2D(latitude: store.lat, longitude: store.lon)
        )
      }
    }
  }
}
