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
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Spacer()
                    
                    HStack(spacing: 2) {
                        Text("0")
                            .font(Font.custom("Anta", size: 24))
                            .foregroundColor(Color(red: 0.48, green: 0.85, blue: 0.77))
                        
                        Image("star")
                            .resizable()
                            .frame(width: 55, height: 80)
                        
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, -10)
                    .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.25))
                                )
                    .padding(.trailing, 20)
                    
                }

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
                            CharacterView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                .ignoresSafeArea()
                .padding(.bottom, 160)
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
                        .frame(width: 110, height: 75)
                    
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
                    .ignoresSafeArea()
                
                ZStack {
                
                    Rectangle()
                      .foregroundColor(.clear)
                      .frame(width: 350, height: 300)
                      .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                      .cornerRadius(10)
                    
                    HStack(alignment: .center) {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Missions for Today:")
                                .font(Font.custom("Anta", size: 26))
                                .foregroundColor(Color(red: 0.23, green: 0.18, blue: 0.30))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 40)
                                .padding(.bottom, 16)
                            
                            ForEach($tasks) { $task in
                                HStack {
                                    Button(action: {
                                        task.isCompleted.toggle()
                                    }) {
                                            Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                                            .foregroundColor(task.isCompleted ? Color(red: 0.14, green: 0.71, blue: 0.66) : Color.white)
                                                .font(.title2)
                                                
                                        }
                                        Text(task.name)
                                            .font(Font.custom("Anta", size: 20))
                                            .foregroundColor(Color.white)
                                            .opacity(0.77)
                                    Spacer()
                                }
                                .padding()
                                .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(red: 0.74, green: 0.69, blue: 0.80).opacity(0.25))
                                            .frame(width: 320)
                                        )
                                .padding(.horizontal, 40)
                                
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
    

  /*  struct CharacterView: View {
        let base: String = "base-alien"
        let hat: String
        let eyes: String
        let mouth: String
        let accessory: String
        
        init(
            base: String = "base-alien",
            
            hat: String = "cap",
            eyes: String = "glasses",
            mouth: String = "smile",
            accessory: String = "necklace"
        ) {
            self.hat = hat
            self.eyes = eyes
            self.mouth = mouth
            self.accessory = accessory
        }
        
        var body: some View {
            ZStack {
                Color(red: 59/255, green: 47/255, blue: 76/255)
                
                Image(base)
                    .resizable()
                    .frame(width: 280, height: 400)
                    .padding(.leading, 20)
                    .padding(.trailing, -5)
                Image(eyes)
                    .resizable()
                    .frame(width: 200, height: 100)
                    .padding(.top, -60)
                Image(mouth)
                    .resizable()
                    .frame(width: 200, height: 100)
                    .padding(.top, 50)
                Image(accessory)
                    .resizable()
                    .frame(width: 220, height: 100)
                    .padding(.top, 120)
                    .padding(.trailing, -50)
                Image(hat)
                    .resizable()
                    .frame(width: 280, height: 250)
                    .padding(.top, -140)
            }
        }
    }

struct CharacterPart {
    let images: [String]
    var selectedIndex: Int = 0
}
class CharacterViewModel: ObservableObject {
    @Published var hat = CharacterPart(images: ["crown", "cap", "hair", "beanie"])
    @Published var eyes = CharacterPart(images: ["emo", "glasses", "worried", "surprised", "sparkle"])
    @Published var mouth = CharacterPart(images: ["smirk", "smile", "meow", "frown", "tongue"])
    @Published var accessory = CharacterPart(images: ["spikes", "shirt", "necklace", "tie", "bandana"])
}
struct CharacterCustomizerPage: View {
    @StateObject private var viewModel = CharacterViewModel()
    @State private var hatIndex = 0
    @State private var eyesIndex = 0
    @State private var mouthIndex = 0
    @State private var accessoryIndex = 0
    @State private var selectedFeature = 0

    var body: some View {
        VStack {
            ZStack {
                Image("baseCharacter")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                
                Image(viewModel.eyes.images[viewModel.eyes.selectedIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .offset(y: -50)
                
                Image(viewModel.mouth.images[viewModel.mouth.selectedIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .offset(y: 10)
                
                Image(viewModel.hat.images[viewModel.hat.selectedIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .offset(y: -120)
                
                Image(viewModel.accessory.images[viewModel.accessory.selectedIndex])
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .offset(y: 100)
            }

            Spacer()
                    }
        // Control Sections
                    CustomizationSection(title: "Hat", part: $viewModel.hat)
                    CustomizationSection(title: "Necklace", part: $viewModel.necklace)
                    CustomizationSection(title: "Eyes", part: $viewModel.eyes)
                    CustomizationSection(title: "Mouth", part: $viewModel.mouth)

                    Spacer()
                }
                }

struct CustomizationSection: View {
    var title: String
    @Binding var part: CharacterPart

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)

            Spacer()

            Button(action: {
                if part.selectedIndex > 0 {
                    part.selectedIndex -= 1
                }
            }) {
                Image(systemName: "WL-arrow")
                    .font(.title2)
            }

            Text("(part.selectedIndex + 1)/(part.images.count)")
                .frame(width: 50)

            Button(action: {
                if part.selectedIndex < part.images.count - 1 {
                    part.selectedIndex += 1
                }
            }) {
                Image(systemName: "WR-arrow")
                    .font(.title2)
            }
        }
        .padding(.horizontal)
    }
}
*/

struct CharacterView: View {
    @State private var selectedEyes = "emo"
    @State private var selectedMouth = "smile"
    @State private var selectedAccessory = "bandana"
    @State private var selectedHat = "crown"
    
    let base: String = "base-alien"
    let eyesOptions = ["emo", "worried", "sparkle", "surprised", "glasses" ]
    let hatOptions = ["crown", "cap", "hair", "beanie", "sweatband"]
    let mouthOptions = ["meow", "smile", "smirk", "frown", "tongue"]
    let accessoryOptions = ["spikes", "shirt", "necklace", "tie", "bandana"]
    
    var body: some View {
        VStack {
            ZStack {
                Image(base)
                                   .resizable()
                                   .frame(width: 280, height: 400)
                               Image(selectedEyes)
                                   .resizable()
                                   .frame(width: 200, height: 100)
                                   .padding(.top, -60)
                               Image(selectedMouth)
                                   .resizable()
                                   .frame(width: 200, height: 100)
                                   .padding(.top, 50)
                               Image(selectedAccessory)
                                   .resizable()
                                   .frame(width: 220, height: 100)
                                   .padding(.top, 120)
                                   .offset(x: -9, y: 2)
                               Image(selectedHat)
                                   .resizable()
                                   .frame(width: 280, height: 280)
                                   .padding(.top, 10)
                                   .offset(x: 13, y: -70)
                           }
                           .padding(.top, 30)

                           // ⭐️ Toggleable Feature Views (Put these here!)
                           FeatureGalleryView(title: "Eyes", options: eyesOptions, selected: $selectedEyes)
                           FeatureGalleryView(title: "Mouth", options: mouthOptions, selected: $selectedMouth)
                           FeatureGalleryView(title: "Hat", options: hatOptions, selected: $selectedHat)
                           FeatureGalleryView(title: "Accessory", options: accessoryOptions, selected: $selectedAccessory)
            
            
            
            // Move FeatureButtonGroups inside VStack
            /* FeatureButtonGroup(title: "Eyes", options: eyesOptions, selected: $selectedEyes)
             FeatureButtonGroup(title: "Mouth", options: mouthOptions, selected: $selectedMouth)
             FeatureButtonGroup(title: "Hat", options: hatOptions, selected: $selectedHat)
             FeatureButtonGroup(title: "Accessory", options: accessoryOptions, selected: $selectedAccessory)
             
             Spacer()
             }
             }
             }
             struct FeatureButtonGroup: View {
             let title: String
             let options: [String]
             @Binding var selected: String
             
             var body: some View {
             
             HStack {
             ForEach(options, id: \.self) { option in
             Button(action: {
             selected = option
             }) {
             Text(option.capitalized) // or use an image if you want
             .padding(6)
             .background(selected == option ? Color.blue.opacity(0.3) : Color.clear)
             .cornerRadius(8)
             } .buttonStyle(BorderlessButtonStyle())
             }
             .padding(.horizontal)
             }
             }
             }*/
            
        }
    }
}
struct FeatureGalleryView: View {
    let title: String
    let options: [String]
    @Binding var selected: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.headline)
                .padding(.bottom, 5)
            
            HStack (spacing: 20) {
                Button(action: {
                    if let currentIndex = options.firstIndex(of:selected) {
                        let newIndex = (currentIndex - 1 + options.count) % options.count
                        selected = options[newIndex]
                    }
                }) {
                    HStack{
                        Image(systemName: "chevron.left.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.blue)
                        
                        Image(selected)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                 
                        Button(action: {
                            if let currentIndex = options.firstIndex(of: selected) {
                                let newIndex = (currentIndex + 1) % options.count
                                selected = options[newIndex]
                            }
                        }) {
                                Image(systemName: "chevron.right.circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
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
