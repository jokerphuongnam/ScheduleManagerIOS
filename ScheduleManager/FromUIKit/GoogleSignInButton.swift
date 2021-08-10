import Foundation
import Firebase
import SwiftUI
import GoogleSignIn

struct GoogleSignInButton : UIViewRepresentable {
    typealias Completed = (_ uid: String) -> Void
    
    private var completed: Completed?
    
    init(completed: Completed? = nil) {
        self.completed = completed
    }
    
    private var style: GIDSignInButtonStyle = .iconOnly
    private var colorScheme: GIDSignInButtonColorScheme = .light
    
    func makeUIView(context: Context) -> GIDSignInButton {
        let button = GIDSignInButton()
        button.style = style
        button.addTarget(context.coordinator, action: #selector(context.coordinator.touchDown(_:)), for: .touchDown)
        return button
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
        
    }
    
    func makeCoordinator() -> GoogleSignInButtonCoordinator {
        GoogleSignInButtonCoordinator(completed: completed)
    }
    
    typealias UIViewType = GIDSignInButton
    
    class GoogleSignInButtonCoordinator {
        typealias Completed = (_ uid: String) -> Void
        
        private var completed: Completed? = nil
        init(completed: Completed?) {
            self.completed = completed
        }
        
        @objc func touchDown(_ sender: GIDSignInButton) {
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            
            guard let viewController = UIApplication.shared.windows.first?.rootViewController else {
                return
            }
            
            // Start the sign in flow!
            GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { [weak self] user, error in
                guard let self = self else {
                    return
                }
                if let error = error {
                    print(error)
                    return
                }
                
                guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                else {
                    return
                }
                
                //                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                guard let uid = Auth.auth().currentUser?.uid else {
                    return
                }
                self.completed?(uid)
                let firebaseAuth = Auth.auth()
                do {
                    try firebaseAuth.signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            }
        }
    }
    
}

#if DEBUG
struct GoogleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButton { uid in
            print("\(uid)")
        }
    }
}
#endif
