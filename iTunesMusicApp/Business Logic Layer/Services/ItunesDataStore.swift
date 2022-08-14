//
//  ItunesDataStore.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 12/08/22.
//

import Foundation

protocol ItunesDataStoreProtocol: AnyObject {
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<AlbumResult, APIError>) -> Void)
    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<SongResult, APIError>) -> Void)
    func fetchMovies(searchTerm: String, completion: @escaping(Result<MovieResult, APIError>) -> Void)
    func fetchOtherMediaContent(searchTerm: String, entity: EntityType, completion: @escaping(Result<OtherMediaTypeResult, APIError>) -> Void)
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void)
}

extension ItunesDataStoreProtocol {
    func fetchAlbums(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<AlbumResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, type: .album, page: page, limit: limit)
        fetch(type: AlbumResult.self, url: url, completion: completion)
    }

    func fetchSongs(searchTerm: String, page: Int, limit: Int, completion: @escaping(Result<SongResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, type: .song, page: page, limit: limit)
        fetch(type: SongResult.self, url: url, completion: completion)
    }

    func fetchMovies(searchTerm: String, completion: @escaping(Result<MovieResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, type: .movie, page: nil, limit: nil)
        fetch(type: MovieResult.self, url: url, completion: completion)
    }

    func fetchOtherMediaContent(searchTerm: String, entity: EntityType, completion: @escaping(Result<OtherMediaTypeResult, APIError>) -> Void) {
        let url = createURL(for: searchTerm, type: entity, page: nil, limit: nil)
        fetch(type: OtherMediaTypeResult.self, url: url, completion: completion)
    }

    func createURL(for searchTerm: String, type: EntityType, page: Int?, limit: Int?) -> URL? {
        //https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
        let baseURL = "https://itunes.apple.com/search"
        var queryItems = [URLQueryItem(name: "term", value: searchTerm),
                          URLQueryItem(name: "entity", value: type.rawValue)]

        if let page = page, let limit = limit {
            let offset = page * limit
            queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
            queryItems.append(URLQueryItem(name: "offset", value: String(offset)))
        }

        var components = URLComponents(string: baseURL)
        components?.queryItems = queryItems
        return components?.url
    }
}

class ItunesDataStore: ItunesDataStoreProtocol {
    func fetch<T: Decodable>(type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {

        guard let url = url else {
            let error = APIError.unknown
            completion(Result.failure(error))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completion(Result.failure(APIError.unknown))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.unknown))
            } else if let data = data {

                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.unknown))
                }
            }
        }.resume()
    }
}
