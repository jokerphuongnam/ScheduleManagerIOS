import Foundation
import SwiftUI

extension View {
    @inlinable public  func alert<Content>(isPresented: Binding<Bool>, content: () -> Content) -> some View where Content: View {
        let wrappedValue = isPresented.wrappedValue
        return ZStack {
            self
                .blur(radius: wrappedValue ? 20 : 0)
                .disabled(wrappedValue)
                .shadow(radius: wrappedValue ? 1 : 0)
            if wrappedValue {
                content()
                    .padding()
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(16)
                    .clipped()
                    .shadow(radius: 1)
            }
        }
    }
}
