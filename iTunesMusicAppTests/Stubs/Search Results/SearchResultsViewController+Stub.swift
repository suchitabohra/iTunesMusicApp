//
//  MediaTypeViewController+Stub.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

extension SearchResultsViewController {
    static func stub(isMock: Bool = false) -> SearchResultsViewController? {
        let window: UIWindow!
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as? SearchResultsViewController else {
            return nil
        }
        let albums = HelperFunctions.getAlbumArray()
        let results = [EntityType.album.key: albums, EntityType.song.key: HelperFunctions.getSongArray(), EntityType.movie.key: HelperFunctions.getMovieArray(), EntityType.audiobook.key: HelperFunctions.getOtherMediaArray()] as [String : [Any]]
        SearchResultConfigurator.configureModule(with: results, viewController: viewController)
        viewController.loadViewIfNeeded()
        viewController.collectionView.reloadData()
        window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(viewController.view)
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        return viewController
    }
}

class HelperFunctions {
    static func getAlbumArray() -> [Album] {
        let data = JSONHelper.readLocalJSONFile(forName: "AlbumResponse")
        let array = decodeJson(type: AlbumResult.self, data: data)
        return array!.results
    }
    
    static func getSongArray() -> [Song] {
        let data = JSONHelper.readLocalJSONFile(forName: "SongResponse")
        let array = decodeJson(type: SongResult.self, data: data)
        return array!.results
    }
    
    static func getMovieArray() -> [Movie] {
        let data = JSONHelper.readLocalJSONFile(forName: "MovieResponse")
        let array = decodeJson(type: MovieResult.self, data: data)
        return array!.results
    }
    
    static func getOtherMediaArray() -> [OtherMediaTypeModel] {
        let data = JSONHelper.readLocalJSONFile(forName: "OtherMediaTypeResponse")
        let array = decodeJson(type: OtherMediaTypeResult.self, data: data)
        return array!.results
    }
    
    private static func decodeJson<T: Decodable>(type: T.Type, data: Data?) -> T? {
        if let data = data {
            do {
                let result = try JSONDecoder().decode(type, from: data)
                return result
            } catch {
               
            }
        }
        return nil
    }
    
}


