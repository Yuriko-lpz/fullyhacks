//
//  KidCardView.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//

import Foundation
import SwiftUI

struct KidCardView: View {
    let kid: Kid // Your Kid model must match this structure

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 338, height: 150)
                .background(Color(red: 0.52, green: 0.45, blue: 0.61))
                .cornerRadius(10)

            HStack(alignment: .top) {
                Image("base-alien")
                    .resizable()
                    .frame(width: 100, height: 150)
                    .padding(.leading, 35)

                VStack(alignment: .leading) {
                    Text(kid.name)
                        .font(Font.custom("Anta", size: 28))
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    ForEach(kid.taskManager.tasks) { task in
                        TaskRowView(task: task)
                    }
                    .padding(.top, -15)
                }
            }
        }
    }
}

#Preview {
    let taskManager = TaskManager()
    taskManager.tasks = [
        TaskManager.Task(id: UUID(), name: "Clean Room", points: 10),
        TaskManager.Task(id: UUID(), name: "Feed Pet", points: 5)
    ]
    
    let sampleKid = Kid(name: "Zara")
    sampleKid.taskManager = taskManager
    
    return KidCardView(kid: sampleKid)
}
