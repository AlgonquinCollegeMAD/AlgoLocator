import Foundation

struct Store: Hashable, Equatable, Identifiable {
  var id = UUID().uuidString
  var name: String
  var lon: Double
  var lat: Double
  var address: String

  static func == (lhs: Store, rhs: Store) -> Bool {
    lhs.lat == rhs.lat && lhs.lon == rhs.lon
  }
}
