import UIKit
import Apollo

// Change localhost to your machine's local IP address when running from a device
let apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    apollo.cacheKeyForObject = { $0["id"] }
    return true
  }
}
