import SwiftUI
import Firebase
import GoogleSignIn
import GoogleUtilities
import FirebaseAuth

@main
struct ScheduleManagerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appdelegate
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
    }
}

private class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
