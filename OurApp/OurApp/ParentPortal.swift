import SwiftUI

struct ParentPortal: View {
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.18, blue: 0.30)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Parent Portal")
                    .font(Font.custom("Anta", size: 40))
                    .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))

                Text("Here you can manage your child's progress, chores, and rewards!")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ParentPortal()
}
