import SwiftUI

struct DashboardView: View {
    @ObservedObject private var viewModel: DashboardViewModel = DashboardViewModel()
    @ObservedObject private var state: DashboardState = DashboardState()
    
    var body: some View {
        NavigationView {
            if state.isNotLogin {
                Spacer()
                    .fullScreenCover(isPresented: $state.isNotLogin, content: {
                        LoginView()
                            .environmentObject(state)
                    })
            }else{
                VStack {
                    Button {
                        state.isNotLogin = true
                    } label: {
                        Text("Login")
                    }
                }
                .navigationTitle("Dashboard")
                
            }
        }
    }
}

class DashboardState : ObservableObject {
    @Published var isNotLogin = true
}

#if DEBUG
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
#endif
