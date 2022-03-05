//
//  Content-ViewModel.swift
//  PasswordGenerator
//
//  Created by Federico on 05/03/2022.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published var passwords: [Password] = []
        @Published var containsSymbols = true
        @Published var containsUppercase = false
        @Published var length = 10
        
        init() {
            createPassword()
        }
        
        func createPassword() {
            let alphabet = "abcdefghijklmnopqrstuvwxyz"
            var base = alphabet + "123456790"
            var newPassword = ""
            
            if containsSymbols {
                base += "!£$%&/()=?^;:_*,.-"
            }
            if containsUppercase {
                base += alphabet.uppercased()
            }
            
            for _ in 0..<length {
                let randomChar = base.randomElement()!
                newPassword += String(randomChar)
            }
            
            let password = Password(password: newPassword, containsSymbols: containsSymbols, containsUppercase: containsUppercase)
            
            withAnimation {
                passwords.insert(password, at: 0)
            }
        }
    }
}
