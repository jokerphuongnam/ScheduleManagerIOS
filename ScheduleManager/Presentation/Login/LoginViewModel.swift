import Foundation

class LoginViewModel : ObservableObject {
    typealias Completed = () -> Void
    @Published internal var email: String = ""
    
    @Published internal var password: String = ""
    
    @Published internal var errorLogin: String? = ""
    
    @Published internal var isLoading: Bool = false
    
    internal func login(completed: @escaping Completed) {
        errorLogin = ""
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            if self.email.isEmpty || self.password.isEmpty {
                self.errorLogin = "Username or password be empty"
            } else {
                self.errorLogin = nil
                completed()

            }
        }
    }
}
