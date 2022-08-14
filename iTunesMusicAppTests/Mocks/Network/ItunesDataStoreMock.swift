//
//  ItunesDataStoreMock.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class JSONHelper {
    static func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}


class ItunesDataStoreMock: ItunesDataStoreProtocol {
    var data: Data?
    var isError = false
    func fetch<T>(type: T.Type, url: URL?, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable {
        if isError {
            completion(Result.failure(APIError.unknown))
        } else {
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.unknown))
                }
            }
        }
    }
}
