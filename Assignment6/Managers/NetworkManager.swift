//
//  NetworkManager.swift
//  Assignment6
//
//  Created by Suguru Tokuda on 10/26/23.
//

import Foundation

class NetworkManager {
    func getRandomErrorCode() -> Int {
        return Int.random(in: 200...599) // return an integer between 200 and 599
    }
    
    func handleNetworkError(error: NetworkError) {
        switch error {
        case .authenticationError(statusCode: _):
            print(error.localizedDescription)
        case .badRequestError(statusCode: _):
            print(error.localizedDescription)
        case .serverError(statusCode: _):
            print(error.localizedDescription)
        case .unkownError(statusCode: _):
            print(error.localizedDescription)
        }
    }
}
