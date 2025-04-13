//
//  ParentHomePage.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//

import SwiftUI

struct ParentHomePage: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 500, height: 70)
              .background(Color(red: 0.74, green: 0.69, blue: 0.80))
            // Top tab bar
            HStack(spacing: 0) {
                TabButton(title: "Family", imageName: "Satellite", bgColor: Color(red: 102/255, green: 82/255, blue: 130/255), index: 0, selectedTab: $selectedTab)
                
                TabButton(title: "Missions", imageName: "iss", bgColor: Color(red: 80/255, green: 64/255, blue: 103/255), index: 1, selectedTab: $selectedTab)
                
                TabButton(title: "Account", imageName: "pfp", bgColor: Color(red: 59/255, green: 47/255, blue: 76/255), index: 2, selectedTab: $selectedTab)
            }
            
            // Content area
            ZStack {
                switch selectedTab {
                case 0:
                    FamilyView()
                case 1:
                    MissionsView()
                case 2:
                    AccountView()
                default:
                    FamilyView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

struct TabButton: View {
    var title: String
    var imageName: String
    var bgColor: Color
    var index: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack() {
                Image(imageName)
                    .resizable()
                    .frame(width: 80, height: 80)

                Text(title)
                    .font(Font.custom("Anta", size: 16))
                    .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
            }
            .frame(maxWidth: .infinity) // fill available width
            .padding(.vertical, 10)
            .background(bgColor)
        }
        .buttonStyle(PlainButtonStyle()) // remove default blue tint
    }
}

struct FamilyView: View {
    @State private var isKidRegistered: Bool = true
    
    var body: some View {
        ZStack {
            Color(red: 102/255, green: 82/255, blue: 130/255) // Background color for Dashboard
            VStack {
                HStack {
                    Text("Family")
                        .font(Font.custom("Anta", size: 28))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                    Spacer().frame(width: 252)
                }
                .padding(.top, 50)
                
                if isKidRegistered {
                    ZStack {
                        Rectangle()
                          .foregroundColor(.clear)
                          .frame(width: 338, height: 150)
                          .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                          .cornerRadius(10)
                        
                        HStack {
                            //add code
                        }
                    }
                }
                
                ZStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 193, height: 39)
                      .background(Color(red: 0.74, green: 0.69, blue: 0.80).opacity(0.77))
                      .cornerRadius(10)
                    
                    Text("+ add alien")
                      .font(Font.custom("Anta", size: 24))
                      .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                }
                .padding(.top, 40)
                
                Spacer()
                
                
                
            }
        }
    }
}

struct MissionsView: View {
    @State private var selectedKid: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 80/255, green: 64/255, blue: 103/255) // Background color for Tasks
            VStack {
                HStack {
                    Text("Parent Mission Control")
                        .font(Font.custom("Anta", size: 28))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        
                    Spacer().frame(width: 43)
                }
                .padding(.top, 50)
                
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 338, height: 35)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .cornerRadius(10)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                        )
                    
                    HStack {
                        if selectedKid == "" {
                            Text("Select a Kid")
                                .font(Font.custom("Anta", size: 20))
                                .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                .padding(.leading, 40)
                            Spacer()
                            Image("triangle").padding(.trailing, 40)
                            
                        } else {
                            
                        }
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct AccountView: View {
    var body: some View {
        ZStack {
            Color(red: 59/255, green: 47/255, blue: 76/255) // Background color for Settings
            VStack {
                HStack {
                    Text("Account Details")
                        .font(Font.custom("Anta", size: 28))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                    
                    Spacer().frame(width: 140)
                }
                .padding(.top, 50)
                
                ZStack {
                
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 355, height: 100)
                      .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                      .cornerRadius(10)
                    
                    HStack(alignment: .center) {

                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Email")
                                .font(Font.custom("Anta", size: 20))
                                .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                .padding(.leading, 3)
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 280, height: 39)
                                    .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                                    .cornerRadius(10)
                                
                                Text("something@email.com")
                                  .font(Font.custom("Anta", size: 20))
                                  .foregroundColor(Color(red: 0.52, green: 0.45, blue: 0.30))
                                  .padding(.leading, 8)
                            }
                        }
                        .padding(.trailing, 10)
                        
                        Image("arrow")
                    }
                }
                
                ZStack {
                
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 355, height: 100)
                      .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                      .cornerRadius(10)
                    
                    HStack(alignment: .center) {

                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Password")
                                .font(Font.custom("Anta", size: 20))
                                .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                .padding(.leading, 3)
                            
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 280, height: 39)
                                    .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                                    .cornerRadius(10)
                                
                                Text("Change Password")
                                  .font(Font.custom("Anta", size: 20))
                                  .foregroundColor(Color(red: 0.52, green: 0.45, blue: 0.30))
                                  .padding(.leading, 8)
                            }
                        }
                        .padding(.trailing, 10)
                        
                        Image("arrow")
                    }
                }
                .padding(.top, 15)
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    ParentHomePage()
}
