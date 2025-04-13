//
//  MissionRewards.swift
//  OurApp
//
//  Created by Daisy Martinez on 4/13/25.
//

import Foundation

struct MissionReward {
    let id: UUID
    var name: String
    var requiredStars: Int
}

class MissionRewardManager: ObservableObject {
    @Published var rewards: [MissionReward] = []

    // Add a new reward
    func addReward(name: String, requiredStars: Int) {
        let newReward = MissionReward(id: UUID(), name: name, requiredStars: requiredStars)
        rewards.append(newReward)
    }
}
