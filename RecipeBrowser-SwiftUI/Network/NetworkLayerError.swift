//
//  NetworkLayerError.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import Foundation

enum NetworkLayerError: Error {
    case statusError(Int)
    case httpError
}
