import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel: RegisterViewModel = RegisterViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Email:")
                
                TextField("example@email.com", text: $viewModel.email)
                    .padding()
                    .background(Color.lightGrey)
                    .cornerRadius(5.0)
                
                
                error(errorMessage: viewModel.errorEmail)
            }
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                Text("Password:")
                
                SecureField("Password123", text: $viewModel.password)
                    .padding()
                    .background(Color.lightGrey)
                    .cornerRadius(5.0)
                
                error(errorMessage: viewModel.errorPassword)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            VStack(alignment: .leading) {
                Text("Repet password:")
                
                SecureField("Repet password", text: $viewModel.repetPassword)
                    .padding()
                    .background(Color.lightGrey)
                    .cornerRadius(5.0)
                
                error(errorMessage: viewModel.errorRepetPassword)
            }
            .padding(.top, 16)
            .padding(.horizontal, 16)
            
            error(errorMessage: viewModel.errorRegister)
            
            NavigationLink(
                destination: CreateProfileView(),
                isActive: $viewModel.isSuccess,
                label: {
                    
                })
            
            Button(action: {
                withAnimation {
                    viewModel.register()
                }
            }, label: {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 50, alignment: .center)
                    .background(Color.yellow)
                    .cornerRadius(16)
            })
            .padding(.top, 16)
            
            VStack {
                or
                
                HStack {
                    Spacer()
                    
                    GoogleSignInButton { uid in
                        print("\(uid)")
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 16)
            
            Spacer()
        }
        .navigationTitle("Register")
    }
}

#if DEBUG
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
#endif
