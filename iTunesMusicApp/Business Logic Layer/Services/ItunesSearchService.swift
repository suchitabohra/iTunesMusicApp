//
//  ItunesSearchService.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 12/08/22.
//

import Foundation
class ItunesSearchService {
    var itunesDataStore: ItunesDataStoreProtocol
    init(itunesDataStore: ItunesDataStoreProtocol) {
        self.itunesDataStore = itunesDataStore
    }
    func searchContent(with searchTerm: String,
                       selectedEntities: [EntityType],
                       completion: @escaping (_ results: [String: [Any]]?, _ error: String?) -> Void) {
        var searchResults: [String: [Any]] = [String: [Any]]()
        var errorMessage = ""
        let group = DispatchGroup()
        for entity in selectedEntities {
            switch entity {
            case .album:
                group.enter()
                itunesDataStore.fetchAlbums(searchTerm: searchTerm, page: 0, limit: 15) { result in
                    switch result {
                    case .success(let results):
                        var albums: [Album] = [Album]()
                        for album in results.results {
                            albums.append(album)
                        }
                        searchResults[entity.key] = albums
                        print("fetched albums \(albums)")
                        group.leave()
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        group.leave()
                    }
                }
            case .song:
                group.enter()
                itunesDataStore.fetchSongs(searchTerm: searchTerm, page: 0, limit: 15) { result in
                    switch result {
                    case .success(let results):
                        searchResults[entity.key] = results.results
                        print("fetched songs \(results.resultCount)")
                        group.leave()
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        group.leave()
                    }
                }
            case .movie:
                group.enter()
                itunesDataStore.fetchMovies(searchTerm: searchTerm) { result in
                    switch result {
                    case .success(let results):
                        searchResults[entity.key] = results.results
                        print("fetched movies \(results.resultCount)")
                        group.leave()
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        group.leave()
                    }
                }
            default:
                group.enter()
                itunesDataStore.fetchOtherMediaContent(searchTerm: searchTerm, entity: entity) { result in
                    switch result {
                    case .success(let results):
                        searchResults[entity.key] = results.results
                        group.leave()
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                        group.leave()
                    }
                }
            }
        }
        group.notify(queue: DispatchQueue.main) {
            completion(searchResults, errorMessage)
        }
    }

}
