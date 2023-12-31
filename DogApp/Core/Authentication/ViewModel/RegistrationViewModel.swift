//
//  RegistrationViewModel.swift
//  DogApp
//
//  Created by 向前 on 7/10/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws{
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        email = ""
        password = ""
    }
}
