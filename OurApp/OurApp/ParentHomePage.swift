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
            // Top colored bar
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color(red: 0.74, green: 0.69, blue: 0.80))
                    .frame(height: geometry.safeAreaInsets.top)
                    .ignoresSafeArea(.container, edges: .top)
            }.frame(height: 1)
                .background(Color(red: 0.74, green: 0.69, blue: 0.80))

            // Tab Buttons
            HStack(spacing: 0) {
                TabButton(title: "Family", imageName: "Satellite", bgColor: Color(red: 102/255, green: 82/255, blue: 130/255), index: 0, selectedTab: $selectedTab)
                TabButton(title: "Missions", imageName: "ISS", bgColor: Color(red: 80/255, green: 64/255, blue: 103/255), index: 1, selectedTab: $selectedTab)
                TabButton(title: "Account", imageName: "pfp", bgColor: Color(red: 59/255, green: 47/255, blue: 76/255), index: 2, selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity)
            .padding(0)

            // Content area
            ZStack {
                switch selectedTab {
                case 0:
                    NavigationView {
                        FamilyView()
                    }
                case 1:
                    MissionsView()
                case 2:
                    AccountView()
                default:
                    NavigationView {
                        FamilyView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea(edges: .bottom)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
            VStack(alignment: .center) {
                Image(imageName)
                    .resizable()
                    .frame(width: 85, height: 85)

                Text(title)
                    .font(Font.custom("Anta", size: 20))
                    .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                    .padding(.top, -10)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(bgColor)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: UIScreen.main.bounds.width / 3)
    }
}

struct FamilyView: View {
    @EnvironmentObject var parentManager: ParentManager
    @State private var isKidRegistered: Bool = true
    
    var body: some View {
        NavigationView {
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
                    
                    ForEach(parentManager.kids, id: \.id) { kid in
                        KidCardView(kid: kid)
                    }
                    
                    
                    NavigationLink(destination: AddAlienView()) {
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
                    }.padding()
                    
                    Spacer()
                }
            }.ignoresSafeArea()
        }
    }
}

struct MissionsView: View {
    @EnvironmentObject var parentManager: ParentManager // Access the ParentManager
    @State private var selectedKidID: UUID?

    var selectedKid: Kid? {
        parentManager.kids.first { $0.id == selectedKidID }
    }

    @State private var taskName: String = "" // Task name input
    @State private var taskPoints: String = "" // Task points input
    
    @StateObject var taskManager = TaskManager() // Instance of TaskManager
    
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
                
                // Picker for selecting a kid
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 338, height: 35)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.25), radius: 9, y: 4)
                    
                    HStack {
                        Picker("Select a Kid", selection: $selectedKidID) {
                            Text("Select a Kid").tag(nil as UUID?).font(Font.custom("Anta", size: 20)) // Placeholder
                            ForEach(parentManager.kids, id: \.id) { kid in
                                Text(kid.name)
                                    .tag(kid.id as UUID?) // Use the ID here as the tag
                                    .font(Font.custom("Anta", size: 20))
                            }
                        }
                        .pickerStyle(MenuPickerStyle())  // Makes it look like a dropdown
                        .accentColor(Color(red: 0.23, green: 0.18, blue: 0.30)) // Removes blue tint, you can change to any color you want
                        .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30)) // Text color
                        .padding(.leading, 10)
                        .background(Color(red: 0.52, green: 0.45, blue: 0.61)) // Background color
                        .cornerRadius(10) // Ensure the corners are rounded
                        .padding(.horizontal, 10)
                        .font(Font.custom("Anta", size: 15))
                        
                        // Arrow image (you can remove this if not needed)
                        Spacer()
                        Image("triangle").padding(.trailing, 10)
                    }
                }
                .frame(width: 338, height: 35)
                
                // Task Manager Section (this only appears when a kid is selected)
                if let selectedKid = selectedKid {
                    let _ = print("Selected Kid: \(selectedKid.name)")
                    VStack {
                        // Outer Rectangle for Mission Manager
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width:350, height: 244)
                                .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                                .cornerRadius(10)
                                
                                VStack(alignment: .leading) {
                                    // "Mission Manager" Title
                                    Text("Mission Manager")
                                    .font(Font.custom("Anta", size: 24))
                                        .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                        .padding(.leading, 10)
                                        
                                    // Task Name Text Field
                                    HStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(width: 200, height: 39)
                                            .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                                            .cornerRadius(10)
                                            .overlay(
                                                TextField("Enter task", text: $taskName)
                                                    .padding(.leading, 10)
                                                )
                                            
                                        // Star and Points Input
                                            
                                        TextField("Stars", text: $taskPoints)
                                            .keyboardType(.numberPad)
                                            .padding(.leading, 10)
                                            .frame(width: 100, height: 39)
                                            .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                                            .cornerRadius(10)
                                            .overlay(
                                                Image("star")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 80, height: 80)
                                                    .padding(.leading, 45)
                                            )
                                    }
                                    .padding(.top, 10)
                                    .padding(.leading, 10)
                                        
                                    // Add Mission Button
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 193, height: 39)
                                        .background(Color(red: 0.74, green: 0.69, blue: 0.80).opacity(0.77))
                                        .cornerRadius(10)
                                        .overlay(
                                            Button(action: {
                                                addMission(to: selectedKid)
                                            }) {
                                                Text("+ add mission")
                                                    .font(Font.custom("Anta", size: 24))
                                                    .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                            }
                                        )
                                        .padding(.top, 20)
                                        .padding(.leading, 130)
                                }
                        }
                    }
                }
                
                Spacer()
            }
        }
        
    }
    func addMission(to kid: Kid) {
        guard let points = Int(taskPoints), !taskName.isEmpty else { return }
        
        // Add the new task to the kid's task manager
        kid.taskManager.addTask(name: taskName, points: points)
        
        // Clear input fields after adding the task
        taskName = ""
        taskPoints = ""
    }
    
}

struct AccountView: View {
    @EnvironmentObject var parentManager: ParentManager // Access the ParentManager
    @EnvironmentObject var userManager: UserManager
    
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
                                
                                    Text("hello@gmail.com")
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

struct AddAlienView: View {
    @EnvironmentObject var parentManager: ParentManager
    @Environment(\.dismiss) var dismiss
    @State private var kidName: String = ""
    @State private var isNameValid: Bool = true
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Color(red: 102/255, green: 82/255, blue: 130/255).ignoresSafeArea()
                
                VStack {
                    Text("a new alien appears!")
                        .font(Font.custom("Anta", size: 60))
                        .foregroundColor(Color(red: 123/255, green: 216/255, blue: 196/255))
                        .padding(.bottom, 40)
                        .padding(.top, -100)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal)
                    
                    Image("base-alien")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, -150)
                        .frame(width: 150, height: 250)
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 330, height: 140)
                            .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                            .cornerRadius(10)
                        
                        VStack(spacing: 10) {
                            Text("Enter kid name:")
                                .font(Font.custom("Anta", size: 30))
                                .foregroundColor(.white)
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 270, height: 40)
                                    .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                                    .cornerRadius(26)
                                
                                TextField("Kid's name", text: $kidName)
                                    .padding()
                                    .submitLabel(.done)
                                    .onSubmit {
                                        let trimmedName = kidName.trimmingCharacters(in: .whitespacesAndNewlines)
                                        let allowedCharacters = CharacterSet.letters.union(.whitespaces)
                                        if trimmedName.unicodeScalars.allSatisfy({ allowedCharacters.contains($0) }) {
                                            isNameValid = true
                                        parentManager.addKid(name: trimmedName)
                                            dismiss()
                                        } else {
                                            isNameValid = false
                                        }
                                    }
                                
                            }.frame(width: 270, height: 40)
                        }
                        
                        
                    }.padding(.top, -100)
                    
                    if !isNameValid {
                        Text("Name must only contain letters.")
                            .foregroundColor(.red)
                    }
                        
                }.padding(.bottom, 50)
                
                Spacer()
                
            }
        }
            
    }
}

#Preview {
    ParentHomePage()
}

