//
//  APIError.swift
//  ItunesSearchApp
//
//  Created by Suchita Bohra on 25.07.22.
//

import Foundation

enum APIError: Error {
    case unknown

    var localizedDescription: String {
        switch self {
        case .unknown:
            return "something went wrong"
        }
    }
}
