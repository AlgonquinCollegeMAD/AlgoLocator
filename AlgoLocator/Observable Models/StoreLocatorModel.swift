import Foundation

class StoreLocatorModel: ObservableObject {
  @Published var stores: [Store] = []
  
  init() {
    self.fetchAll()
  }
  
  func fetchAll() {
    let stores = [
      Store(name: "Tim Hortons 1", lon: -75.6835, lat: 45.4216, address: "123 Rideau St"),
      Store(name: "Tim Hortons 2", lon: -75.7224, lat: 45.3655, address: "456 Bank St"),
      Store(name: "Tim Hortons 3", lon: -75.9093, lat: 45.3572, address: "789 Somerset St W"),
      Store(name: "Tim Hortons 4", lon: -75.6950, lat: 45.4299, address: "234 Elgin St"),
      Store(name: "Tim Hortons 5", lon: -75.7315, lat: 45.4036, address: "567 Gladstone Ave"),
      Store(name: "Tim Hortons 6", lon: -75.9132, lat: 45.3452, address: "890 Bronson Ave"),
      Store(name: "Tim Hortons 7", lon: -75.6897, lat: 45.3665, address: "345 Dalhousie St"),
      Store(name: "Tim Hortons 8", lon: -75.7384, lat: 45.4114, address: "678 Bank St"),
      Store(name: "Tim Hortons 9", lon: -75.8518, lat: 45.3142, address: "901 Woodroffe Ave"),
      Store(name: "Tim Hortons 10", lon: -75.6979, lat: 45.4207, address: "234 Laurier Ave W"),
      Store(name: "Tim Hortons 11", lon: -75.7278, lat: 45.3927, address: "567 O'Connor St"),
      Store(name: "Tim Hortons 12", lon: -75.9296, lat: 45.3690, address: "789 Carling Ave"),
      Store(name: "Tim Hortons 13", lon: -75.7085, lat: 45.4003, address: "123 Slater St"),
      Store(name: "Tim Hortons 14", lon: -75.7631, lat: 45.3442, address: "456 Riverside Dr"),
      Store(name: "Tim Hortons 15", lon: -75.8824, lat: 45.4010, address: "789 Churchill Ave N"),
      Store(name: "Tim Hortons 16", lon: -75.6421, lat: 45.4420, address: "234 Montreal Rd"),
      Store(name: "Tim Hortons 17", lon: -75.7366, lat: 45.4214, address: "567 Laurier Ave E"),
      Store(name: "Tim Hortons 18", lon: -75.8829, lat: 45.3305, address: "890 Baseline Rd"),
      Store(name: "Tim Hortons 19", lon: -75.7026, lat: 45.3669, address: "123 Slater St"),
      Store(name: "Tim Hortons 20", lon: -75.7573, lat: 45.4035, address: "456 Queen St"),
      Store(name: "Tim Hortons 21", lon: -75.9324, lat: 45.3412, address: "789 Merivale Rd"),
      Store(name: "Tim Hortons 22", lon: -75.6859, lat: 45.4071, address: "234 Bank St"),
      Store(name: "Tim Hortons 23", lon: -75.8682, lat: 45.3618, address: "567 Fisher Ave"),
      Store(name: "Tim Hortons 24", lon: -75.7460, lat: 45.4256, address: "890 Somerset St W"),
      Store(name: "Tim Hortons 25", lon: -75.6536, lat: 45.3875, address: "123 Elgin St"),
      Store(name: "Tim Hortons 26", lon: -75.8133, lat: 45.3558, address: "456 Bronson Ave"),
      Store(name: "Tim Hortons 27", lon: -75.9117, lat: 45.3855, address: "789 Bank St"),
      Store(name: "Tim Hortons 28", lon: -75.7206, lat: 45.3415, address: "234 Gladstone Ave"),
      Store(name: "Tim Hortons 29", lon: -75.8190, lat: 45.4132, address: "567 Preston St"),
      Store(name: "Tim Hortons 30", lon: -75.9402, lat: 45.3526, address: "789 Merivale Rd")
    ]
    
    self.stores = stores
    
  }
  
}
