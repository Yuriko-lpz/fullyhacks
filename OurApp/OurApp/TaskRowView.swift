//
//  TaskRowView.swift
//  OurApp
//
//  Created by Elena Marquez on 4/13/25.
//

import Foundation
import SwiftUI

struct TaskRowView: View {
    let task: TaskManager.Task

    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 230, height: 30)
                .background(Color(red: 0.74, green: 0.69, blue: 0.80))
                .cornerRadius(10)
                .padding(.leading, -10)

            HStack {
                Text(task.name)
                    .font(Font.custom("Anta", size: 20))
                    .foregroundColor(.white)
                Spacer(minLength: 30)
                Text("\(task.points)")
                    .font(Font.custom("Anta", size: 20))
                    .foregroundColor(.white)
                    .padding(.trailing, -10)
                Image("star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 40)
            }
        }
        .padding(.top, 5)
    }
}
