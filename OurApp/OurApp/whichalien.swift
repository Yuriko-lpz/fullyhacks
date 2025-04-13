//
//  whichalien.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//
import SwiftUI

struct whichalien: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            
            ZStack {
                Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 515, height: 824)
                      .background(Color(red: 0.23, green: 0.18, blue: 0.30));
                
                VStack(spacing: 30) {
                    Text("Which Alien are you?")
                        .font(Font.custom("Anta", size: 60))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        .padding(.bottom, 50)
                    NavigationLink(destination:KidHomePage()) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 266, height: 85)
                                .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                .cornerRadius(15)
                                .shadow(
                                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                                );
                            Image("alien-icon")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(.trailing, 175)
                            
                            
                            Text("KID 1")
                                .font(Font.custom("Anta", size: 24))
                                .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        }.padding(.bottom, 5)
                    }
                    NavigationLink(destination: KidHomePage()) {
                                            ZStack {
                                                Rectangle()
                                                    .foregroundColor(.clear)
                                                    .frame(width: 266, height: 85)
                                                    .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                                    .cornerRadius(15)
                                                    .shadow(
                                                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 9, y: 4
                                                    );
                                                Image("alien-icon")
                                                    .resizable()
                                                    .frame(width: 70, height: 70)
                                                    .padding(.trailing, 175)
                                                
                                                Text("KID 2")
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
                                whichalien()
                            }
