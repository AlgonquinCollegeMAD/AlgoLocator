import SwiftUI

@main
struct AlgoLocatorApp: App {
    var body: some Scene {
        WindowGroup {
            StoreList()
            .environmentObject(StoreLocatorModel())
        }
    }
}
