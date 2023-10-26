//
//  Department.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

class Department {
    private var name: String
    private var accountDict: [String : Account] = [:]
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        return name
    }
    
    func addAccount(account: Account) {
        self.accountDict[account.id.uuidString] = account
    }
    
    func removeAccount(uuidString: String) {
        self.accountDict[uuidString] = nil
    }
}
