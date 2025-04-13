//
//  UserProfile.swift
//  OurApp
//
//  Created by Daisy Martinez on 4/13/25.
//

import Foundation
import Security

struct UserProfile: Codable {
    var name: String
    var email: String
    var loginCode: String
}

class KeychainHelper {
    static func savePassword(_ password: String, for account: String) {
        let data = password.data(using: .utf8)!
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecValueData: data
        ] as CFDictionary

        SecItemDelete(query) // Delete existing
        SecItemAdd(query, nil)
    }

    static func getPassword(for account: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: account,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var result: AnyObject?
        if SecItemCopyMatching(query, &result) == errSecSuccess {
            if let data = result as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }
}

class UserManager: ObservableObject {
    @Published var profile: UserProfile? {
        didSet {
            saveProfile()
        }
    }

    private let profileKey = "userProfile"

    init() {
        loadProfile()
    }
    
    func generateRandomCode() -> String {
        let code = Int.random(in: 1000...9999) // Generates a random 4-digit number
        return String(code)
    }

    func createAccount(name: String, email: String, password: String) {
        let loginCode = generateRandomCode()
        let newProfile = UserProfile(name: name, email: email, loginCode: loginCode)
        self.profile = newProfile

        // Save the profile to UserDefaults (or Keychain for sensitive data)
        saveProfile()

        // Save the password securely using Keychain
        savePassword(password)
    }

    func saveProfile() {
        guard let profile = profile else { return }
        if let encoded = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.set(encoded, forKey: profileKey)
        }
    }

    func loadProfile() {
        if let data = UserDefaults.standard.data(forKey: profileKey),
           let decoded = try? JSONDecoder().decode(UserProfile.self, from: data) {
            self.profile = decoded
        }
    }

    func savePassword(_ password: String) {
        guard let email = profile?.email else { return }
        KeychainHelper.savePassword(password, for: email)
    }

    func getPassword() -> String? {
        guard let email = profile?.email else { return nil }
        return KeychainHelper.getPassword(for: email)
    }
}



