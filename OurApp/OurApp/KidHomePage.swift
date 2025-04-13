//
//  KidHomePage.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//

import SwiftUI

struct KidHomePage: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            Color(red: 0.23, green: 0.18, blue: 0.30)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Welcome!")
                    .font(Font.custom("Anta", size: 40))
                    .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        KidTabButton(title: "Mission", imageName: "orange planet", bgColor: Color(red: 0.23, green: 0.18, blue: 0.30), index: 0, selectedTab: $selectedTab)
                        
                        KidTabButton(title: "Mini Game", imageName: "purple planet", bgColor: Color(red: 0.23, green: 0.18, blue: 0.30), index: 1, selectedTab: $selectedTab)
                        
                        KidTabButton(title: "Character", imageName: "blue planet", bgColor: Color(red: 0.23, green: 0.18, blue: 0.30), index: 2, selectedTab: $selectedTab)
                    }
                    
                    
                    // Content area
                    ZStack {
                        switch selectedTab {
                        case 0:
                            MissionView()
                        case 1:
                            GameView()
                        case 2:
                            CharacterView()
                        default:
                            MissionView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .ignoresSafeArea()
            }
            
        }
    }
    
    
    struct KidTabButton: View {
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
                        .frame(width: 100, height: 70)
                    
                    Text(title)
                        .font(Font.custom("Anta", size: 20))
                        .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                }
                .frame(maxWidth: .infinity) // fill available width
                .padding(.vertical, 10)
                .background(bgColor)
            }
            .buttonStyle(PlainButtonStyle()) // remove default blue tint
        }
    }
    
    struct MissionView: View {
        @State private var tasks: [TaskItem] = [
            TaskItem(name: "Make your bed", isCompleted: false),
            TaskItem(name: "Clean the dishes", isCompleted: false),
            TaskItem(name: "Do your homework", isCompleted: false)
        ]
        var body: some View {
            ZStack {
                Color(red: 59/255, green: 47/255, blue: 76/255)
                
                ZStack {
                
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 350, height: 200)
                      .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                      .cornerRadius(10)
                    
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Missions for Today:")
                                .font(Font.custom("Anta", size: 20))
                                .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 40)
                            
                            ForEach($tasks) { $task in
                                HStack {
                                    Button(action: {
                                        task.isCompleted.toggle()
                                    }) {
                                            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                                .foregroundColor(task.isCompleted ? Color.green : Color.white)
                                                .font(.title2)
                                                
                                        }
                                    Text(task.name)
                                        .font(Font.custom("Anta", size: 20))
                                        .foregroundColor(Color.white)
                                    
                                    
                                }
                                .padding(.leading, 40)
                            }
                        }

                        }
                    }
                            
               
                                
                                
                            }
                        }
                    }
                }

    
    struct GameView: View {
        var body: some View {
            ZStack {
                Color(red: 59/255, green: 47/255, blue: 76/255)
            }
        }
    }
    
    struct CharacterView: View {
        var body: some View {
            ZStack {
                Color(red: 59/255, green: 47/255, blue: 76/255)
            }
        }
    }

struct TaskItem: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool
}




#Preview {
    KidHomePage()
}

