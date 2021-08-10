import SwiftUI

struct CreateProfileView: View {
    @StateObject private var viewModel: CreateProfileViewModel = CreateProfileViewModel()
    
    
    @EnvironmentObject var dashboardState: DashboardState
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                Button {
                    dashboardState.isNotLogin = false
                } label: {
                    Text("pop nav")
                }
            }
        }.navigationTitle("Create profile")
    }
}

#if DEBUG
struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
#endif
