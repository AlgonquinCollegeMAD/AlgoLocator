import SwiftUI

struct StoreList: View {
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
  var store: Store
  
  var body: some View {
    VStack (alignment: .leading) {
      Text(store.name)
        .font(.title3)
      Text(store.address)
        .font(.callout)
    }
  }
}

