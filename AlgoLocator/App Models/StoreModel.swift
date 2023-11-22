import Foundation

struct Store: Hashable, Equatable {
  var name: String
  var lon: Double
  var lat: Double
  var address: String

  static func == (lhs: Store, rhs: Store) -> Bool {
    lhs.lat == rhs.lat && lhs.lon == rhs.lon
  }
    
  init(name: String, lon: Double, lat: Double, address: String) {
    self.name = name
    self.lon = lon
    self.lat = lat
    self.address = address
  }
}
