//
//  ContentView.swift
//  OurApp
//
//  Created by Elena Marquez on 4/12/25.
//

import SwiftUI
import SwiftData

struct WelcomeScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationStack {
            
            ZStack {
                Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 515, height: 824)
                      .background(Color(red: 0.23, green: 0.18, blue: 0.30));
                
                VStack {
                    
                    Text("MissionUp")
                        .font(Font.custom("Anta", size: 70))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        .padding(.bottom, 80);
                    
                    NavigationLink(destination: ParentPortal()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 266, height: 85)
                                .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                .cornerRadius(15)
                                .shadow(
                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                                );
                            
                            Text("PARENTS PORTAL")
                                .font(Font.custom("Anta", size: 24))
                                .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        }.padding(.bottom, 60)
                    }
                    
                    NavigationLink(destination: KidPortal()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 266, height: 85)
                                .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                .cornerRadius(15)
                                .shadow(
                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                                );
                            
                            Text("KIDS PORTAL")
                                .font(Font.custom("Anta", size: 24))
                                .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeScreen()
        .modelContainer(for: Item.self, inMemory: true)
}
