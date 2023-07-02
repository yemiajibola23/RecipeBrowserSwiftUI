//
//  NetworkLayerError.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import Foundation

enum NetworkLayerError: Error, Equatable {
    static func == (lhs: NetworkLayerError, rhs: NetworkLayerError) -> Bool {
        switch (lhs, rhs) {
        case (.statusError, .statusError),
            (.httpError, .httpError), (.invalidData, .invalidData), (.general, .general):
            return true
        default:
            return false
        }
    }
    
    case statusError(Int)
    case httpError
    case invalidData
    case general(Error)
    
    var title: String {
        switch self {
        case .general:
            return "An error occur"
        case .httpError:
            return "HTTP Error"
        case .statusError(let code):
            return "HttP Status \(code)"
        case .invalidData:
            return "Invalid data"
        }
    }
    
    var message: String? {
        switch self {
        case .general(let error):
            return error.localizedDescription
        case .httpError:
            return nil
        case .statusError:
            return nil
        case .invalidData:
            return "Data from the server was incorrect."
        }
    }
}
