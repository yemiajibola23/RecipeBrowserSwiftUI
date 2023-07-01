//
//  NetworkLayer.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 6/30/23.
//

import Foundation

final class NetworkHandler {
    
    // Generic Network Request Handler
    // params: APIRequest
    func handle<T: Decodable>(request: APIRequest) async throws -> T {
        do {
            let networkRequest = NetworkRequest(apiRequest: request)
            let (data, response) = try await URLSession.shared.data(for: networkRequest.request)
            
            guard let response = response as? HTTPURLResponse else { throw NetworkLayerError.httpError }
            
            if response.statusCode == 200 {
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    throw NetworkLayerError.invalidData
                }
                
            } else {
                throw NetworkLayerError.statusError(response.statusCode)
            }
        } catch let error as NetworkLayerError {
            throw error
        } catch {
            throw NetworkLayerError.general(error)
        }
    }
}
