//
//  HomeViewModel.swift
//  QuickPass
//
//  Created by Rishal Bazim on 16/04/25.
//

import Foundation

@Observable
class HomeViewModel {
    var passwordLength: Int = 4
    var activeOptions: [PasswordOption] = [.lowerCase]
    var genPassword = "no-pass"
    func toggleOptions(option: PasswordOption) {
        if activeOptions.contains(option) {
            self.activeOptions = activeOptions.filter { $0 != option }
        } else {
            self.activeOptions.append(option)
        }

        generatePassword()
    }

    func generatePassword() {
        var characters = ""

        if activeOptions.contains(.lowerCase) {
            characters += "abcdefghijklmnopqrstuvwxyz"
        }
        if activeOptions.contains(.upperCase) {
            characters += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        }
        if activeOptions.contains(.numbers) {
            characters += "0123456789"
        }
        if activeOptions.contains(.symbols) {
            characters += "!@#$%^&*()-_=+[]{}|;:,.<>?/"
        }
        if activeOptions.contains(.includeSpace) {
            characters += " "
        }

        guard !characters.isEmpty else {
            self.genPassword = "no-pass"
            return
        }

        var password = ""
        var usedCharacters = Set<Character>()

        while password.count < passwordLength {
            let randomChar = characters.randomElement()!

            if activeOptions.contains(.excludeDuplicates) {
                if usedCharacters.contains(randomChar) {
                    continue
                }
                usedCharacters.insert(randomChar)
            }

            password.append(randomChar)
        }
        self.genPassword = password
    }

}
