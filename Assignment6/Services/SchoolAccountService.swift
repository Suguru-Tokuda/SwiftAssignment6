//
//  SchoolAccountService.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

/*
    A service class and should be used in dependency injections.
 */
class SchoolAccountService {
    // 1. Constructor dependency injection
    var constructorInjecionForNetworkMgr: NetworkManager = NetworkManager()
    // 2. Property dependency injection
    var propertyInjectionForNetworkMgr: NetworkManager?
    
    init() {}
    
    init(constructorInjecionForNetworkMgr: NetworkManager) {
        self.constructorInjecionForNetworkMgr = constructorInjecionForNetworkMgr
    }
    
    // 1. Using constructor depdency injection
    /**
     A Function to create a department object
     */
    func createDepartment(departmentName: String) throws -> Department {
        let statusCode = constructorInjecionForNetworkMgr.getRandomErrorCode()
        
        if statusCode >= 400 && statusCode < 600 {
            switch statusCode {
            case 404:
                throw NetworkError.authenticationError(statusCode: statusCode)
            case 400...499:
                throw NetworkError.authenticationError(statusCode: statusCode)
            case 500...559:
                throw NetworkError.serverError(statusCode: statusCode)
            default:
                throw NetworkError.unkownError(statusCode: statusCode)
            }
        }
        
        return Department(name: departmentName)
    }
    
    // 2. Propety dependency injection
    func createDepartmentWithPropertyInjection(departmentName: String) throws -> Department {
        if (propertyInjectionForNetworkMgr?.getRandomErrorCode()) != nil {
            return Department(name: departmentName)
        } else {
            throw NetworkError.unkownError(statusCode: 999)
        }
    }
    
    // 3. Method injection
    func createDepartment(departmentName: String, networkMgr: NetworkManager) throws -> Department {
        let statusCode = networkMgr.getRandomErrorCode()
        
        if statusCode >= 400 && statusCode < 600 {
            switch statusCode {
            case 404:
                throw NetworkError.authenticationError(statusCode: statusCode)
            case 400...499:
                throw NetworkError.authenticationError(statusCode: statusCode)
            case 500...559:
                throw NetworkError.serverError(statusCode: statusCode)
            default:
                throw NetworkError.unkownError(statusCode: statusCode)
            }
        }
        
        return Department(name: departmentName)
    }
}
