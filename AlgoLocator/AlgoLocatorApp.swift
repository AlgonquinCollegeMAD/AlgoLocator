import SwiftUI

@main
struct AlgoLocatorApp: App {
    var body: some Scene {
        WindowGroup {
          StoreListView()
            .environmentObject(StoreLocatorModel())
            .environmentObject(LocatorModel())
        }
    }
}
