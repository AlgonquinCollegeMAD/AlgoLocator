import SwiftUI
import CoreLocation

struct StoreListView: View {
  @EnvironmentObject var model: StoreLocatorModel
  
  var body: some View {
    List {
      ForEach(model.stores, id:\.self) { store in
        StoreRowView(store: store)
      }
    }
    .padding()
  }
}

struct StoreRowView: View {
  @EnvironmentObject var locator: LocatorModel
  var store: Store
  
  var body: some View {
    VStack (alignment: .leading) {
      Text(store.name)
        .font(.title3)
      Text("\(store.address) (\(distance(to: store)) Km)")
        .font(.callout)
    }
  }
  
  private func distance(to store: Store) -> String {
    guard let currentLocation = locator.currentLocation else { return "--" }
    let storeLocation = CLLocation(latitude: store.lat, longitude: store.lon)
    let distance = currentLocation.distance(from: storeLocation) / 1000
    return String(format: "%.2f", distance)
  }
  
}

