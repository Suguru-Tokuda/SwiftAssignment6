//
//  ViewController.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    /**
        Assignment 6
        Suguru Tokuda
        10/26/2023
     */
    
    /*
        1. Constructor Injection
        2. Property Injection
        3. Method Injection
        4. Access Specifiers, modifiers
        5. Error handling in iOS and different ways, create your own error and function to throw it and localised description for error.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let networkMgr = NetworkManager()
        
        /*
            MARK: Dependency Injection (DI):
            DI is a technique in software development to let one module/class/struct (scope) use the code that comes from another scope. In Swift, there are 3 types of dependency injection techniques.
            1. Constructor Injection
               In class or struct, there is an uninitialized dependency. Passing a new object (as a dependency) into a constructor lets the class/struct use the dependency for their operations. This is the best practice for DI in Swift because the rest of the code does not have to worry about not having the dependency. Downside of this DI is that it takes extra memory even if the operation might not need the dependency.
            
            2. Property Injection
               A kind of DI used with a property. Unlike a constructor injection, a class or struct would have an optional property and the DI takes place after the initializer is called. Down side of this technique is that the depdency could be nil and not available.
         
            3. Method Injection
               DI technique used as a function parameter. This is recommended if the operation can be done without a dependency. For example, a class or struct can have multiple functions (func A, B, C, etc). If only func A requires the dependency, then the function caller should pass the dependency into the func A. This is good for memory saving, however, it requires dependency checking and takes extra work to manage the code.
         */
        
        /*
            MARK: Error handling in Swift
            
            Error handlign in Swift starts with creating an enum which confirms to Error protol. After creating an custom error enum, the rest of the code in the project should handle errors property. There are 3 types of error handling methdos in Swift.
         
            1. do { try ___ } catch {}
            The best way to handle errors in swift, becuase every error can be handled in the catch clause
         
            2. try?
            Second best way to handle error throwing functions in Swift. The program still runs without handling an error. With try? the function call gets ignored if there is an error and proceeds the rest of the code. The downside is that an error is not handled, it just gets ignored.
         
            3. try!
            Should not be used at all in the real projects, because it is equivalent of force unwrap for optional. The application can crash when an error happens.
         
            /Enums/NetworkError.swift contains the examples.         
         */
        
        /*
         The following code shows the examples of error handling and dependency injections.
         */
        
        // Constructor Injection & do ... try ... catch
        let schoolAccountMgrForConstructorInjection = SchoolAccountService(constructorInjecionForNetworkMgr: networkMgr)

        do {
            let itDept = try schoolAccountMgrForConstructorInjection.createDepartment(departmentName: "IT")
            print(itDept.getName())
        } catch let error {
            if let error = error as? NetworkError {
                networkMgr.handleNetworkError(error: error)
            }
        }
        
        // Property injection & try?
        let schoolAccountMgrForPrptyInjection = SchoolAccountService()
        schoolAccountMgrForPrptyInjection.propertyInjectionForNetworkMgr = networkMgr
        
        let psychologyDept = try? schoolAccountMgrForPrptyInjection.createDepartmentWithPropertyInjection(departmentName: "Psychology")
        if let psychologyDept { print(psychologyDept.getName()) }
        
        // Method injection & try!
        let schoolAccountMgrForMethodInjection = SchoolAccountService()
        let englishDept = try! schoolAccountMgrForMethodInjection.createDepartment(departmentName: "English", networkMgr: networkMgr)
        
        print(englishDept.getName())
        
        
        // MARK: Access Specifiers
        /*
            1. internal: a default specifier. classes, structs, enum have access to it within the same module. In this example, all the files under /Assignment6 have access to it.
         
                /Models/Department.swift (class Department) is an example in this project.
         
                // the following code DOES work here.
                let newDept = Department(name: "New Department")
         
            2. private: the most restricted specifier. Classes, stucts, enum outside the scope would not have access to it.
         
                /Models/Student.swift (class PrivateStudent) is an example in this project.
         
                // the following code does NOT work in the ViewController class.
                let privateStudent = PrivateStudent(firstName: "Suguru", lastName: "Tokuda", email: "some@email.com")
         
            3. fileprivate: the second most restricted specifier. Classes, structs, and enums within the same file have access to it.
         
                /Models/Student.swift (class FileprivateStudent) is an example in this project.
         
                // the following code does NOT work in the ViewController class.
                let filePrivateStudent = FileprivateStudent(firstName: "Suguru", lastName: "Tokuda", email: "some@email.com")
            
            4. public: can be accessed from anywhere in the same project.
                /Modules/Student.swift (class Student) is an example in this project.
         
                let newStudent = Student(firstName: "Suguru", lastName: "Tokuda", email: "some@email.com")
         
            5. open: can be inherit a class from another module.
         
                The example is in /Assigment6Tests/Assignment6Tests
         */
    }
}

