import SwiftUI

struct KidPortal: View {
   @State private var code: String = ""
   private let maxDigits = 4
   @FocusState private var isFocused: Bool

   var body: some View {
       ZStack {
           Color(red: 0.23, green: 0.18, blue: 0.30)
               .ignoresSafeArea()

           VStack(spacing: 30) {
               Text("PARENT CODE")
                   .font(Font.custom("Anta", size: 60))
                   .multilineTextAlignment(.center)
                   .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))

               ZStack {
                   
                   TextField("", text: $code)
                       .keyboardType(.numberPad)
                       .textContentType(.oneTimeCode)
                       .focused($isFocused)
                       .onChange(of: code) {
                           code = String(code.filter(\.isNumber).prefix(maxDigits))
                       }
                       .frame(width: 1, height: 1)
                       .opacity(0)

                   HStack(spacing: 15) {
                       ForEach(0..<maxDigits, id: \.self) { index in
                           ZStack {
                               RoundedRectangle(cornerRadius: 15)
                                   .fill(Color(red: 0.52, green: 0.45, blue: 0.61))
                                   .frame(width: 70, height: 80)
                                   .shadow(color: .black.opacity(0.25), radius: 9, y: 4)
                               Text(code.count > index ? String(code[code.index(code.startIndex, offsetBy: index)]) : "")
                                                                  .font(.system(size: 36, weight: .bold, design: .monospaced))
                                                                  .foregroundColor(.white)
                                                          }
                                                      }
                                                  }
                                              }
                                              .contentShape(Rectangle())
                                              .onTapGesture {
                                                  isFocused = true
                                              }
                                              NavigationLink(destination: whichalien()) {
                                                  Text("ENTER")
                                                      .font(Font.custom("Anta", size: 18))
                                                      .foregroundColor(.white)
                                                      .padding()
                                                      .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                                      .cornerRadius(15)
                                              }
                                          }
                                          .padding()
                                      }
                                  }
                              }

                              #Preview {
                                  KidPortal()
                              }
