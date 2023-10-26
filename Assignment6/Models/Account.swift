//
//  Account.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

/*
 Open access specifier : can be inherited even outside the module. Check Assignment6Tests/Assignment6Tests file to see the example.
 */
open class Account {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
