//
//  SchoolSystemError.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

enum NetworkError : Error {
    case authenticationError(statusCode: Int),
         badRequestError(statusCode: Int),
         serverError(statusCode: Int),
         unkownError(statusCode: Int)
}

/*
 LocalizedError protocol:
 Confirming to the protocol enables the developer to show customized (more meaningful) messages.
 NSLocalizedString should be returned because the error message shown to the user can deffer by language.
 */
extension NetworkError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .authenticationError(statusCode: let code):
            return NSLocalizedString("Error \(code): Authentication failed.", comment: "authenticationError")
        case .badRequestError(statusCode: let code):
            return NSLocalizedString("Error \(code): A bad request was sent to the server.", comment: "badRequestError")
        case .serverError(statusCode: let code):
            return NSLocalizedString("Error \(code): A server error occured.", comment: "serverError")
        case .unkownError(statusCode: let code):
            return NSLocalizedString("Error \(code): Unknown error", comment: "unknownError")
        }
    }
}
