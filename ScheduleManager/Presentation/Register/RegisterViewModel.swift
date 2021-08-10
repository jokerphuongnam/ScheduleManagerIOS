import Foundation

class RegisterViewModel : ObservableObject {
    @Published internal var email: String = ""
    @Published internal var errorEmail: String = ""
    
    @Published internal var password: String = ""
    @Published internal var errorPassword: String = ""
    
    @Published internal var repetPassword: String = ""
    @Published internal var errorRepetPassword: String = ""
    
    @Published internal var errorRegister: String? = ""
    
    @Published internal var isSuccess: Bool = false
    
    internal func register() {
        isSuccess = true
    }
}
