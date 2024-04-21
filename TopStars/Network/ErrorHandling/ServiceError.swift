//
//  ServiceError.swift
//  TopStars
//
//  Created by Federico Bustos Fierro on 21/04/2024.
//

import Foundation

enum ServiceError: LocalizedError {
    case noConnection(String)
    case apiError(String)
    
    
    var displayTitle: String {
        switch self {
        case .noConnection(_):
            return "No connection"
        case .apiError(_):
            return "Server down"
        }
    }
    
    var displayMessage: String {
        switch self {
        case .noConnection(let errorDescription):
            return errorDescription
        case .apiError(let errorDescription):
            return errorDescription
        }
    }
}
