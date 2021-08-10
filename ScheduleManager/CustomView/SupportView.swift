import Foundation
import SwiftUI

extension View {
    public var or: some View {
        HStack {
            line
            
            Text("Or")
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            line
        }
    }
    
    public var line: some View {
        VStack {
            Divider()
        }
    }
    
    public func error(errorMessage: String?) -> some View {
        return HStack {
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.error)
                    .padding()
                    .animation(.default)
                
            } else {
                Spacer()
                    .frame(width: 1)
            }
        }
    }
}
