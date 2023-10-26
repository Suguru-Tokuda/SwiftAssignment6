//
//  Student.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

public class Student : Account {
    private var privateStudent: PrivateStudent? // private specifier is required becauase PrivateStudent has private
    fileprivate var filePrivateStudent: FilePrivateStudent // fileprivate is required becauase FilePrivateStudent class has fileprivate specifier
    
    override init(firstName: String, lastName: String, email: String) {
        self.privateStudent = PrivateStudent(firstName: firstName, lastName: lastName, email: email)
        self.filePrivateStudent = FilePrivateStudent(firstName: firstName, lastName: lastName, email: email)
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    
    private init(firstName: String, lastName: String, email: String, privateStudent: PrivateStudent, filePrivateStudent: FilePrivateStudent) {
        self.privateStudent = privateStudent
        self.filePrivateStudent = filePrivateStudent
        super.init(firstName: firstName, lastName: lastName, email: email)
    }
    
    // private modifier: the class can be access only from the same class. In this example, P
    private class PrivateStudent : Student {}
}

// fileprivate: can be accessed within the same file.
fileprivate class FilePrivateStudent : Student {}
