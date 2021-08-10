import SwiftUI
import GoogleSignIn
import Firebase

struct LoginView: View {
    @StateObject internal var viewModel: LoginViewModel = LoginViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .background(Color.lightGrey)
                    .cornerRadius(5.0)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.lightGrey)
                    .cornerRadius(5.0)
                    .padding(.top, 16)
                    .padding(.horizontal, 16)
                
                error(errorMessage: viewModel.errorLogin)
                
                HStack {
                    Spacer()
                    NavigationLink(destination: ForgotPasswordView()) {
                        HStack {
                            Text("Forgot password?")
                        }
                    }
                }
                .padding(.trailing, 16)
                
                Button(action: {
                    withAnimation {
                        viewModel.login() {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }, label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 50, alignment: .center)
                        .background(Color.yellow)
                        .cornerRadius(16)
                })
                
                Spacer()
                
                VStack {
                    or
                    
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 50, alignment: .center)
                            .background(Color.yellow)
                            .cornerRadius(16)
                    }
                    
                    GoogleSignInButton { uid in
                        print("\(uid)")
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 16)
                
                Spacer()
            }
            .navigationTitle("Login")
        }
        .alert(isPresented: $viewModel.isLoading) {
            VStack {
                Text("Loading...")
                    .font(.title3)
                Text("Waiting for test")
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .frame(width: 150, height: 150)
        }
    }
    
    private var line: some View {
        VStack {
            Divider()
        }
    }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
#endif
