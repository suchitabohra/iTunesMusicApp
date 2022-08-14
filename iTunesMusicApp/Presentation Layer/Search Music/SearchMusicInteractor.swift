//
//  SearchInteractor.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import Foundation
import MBProgressHUD

protocol SearchMusicInteractor {
    var selectedMediaTypes: [EntityType]? { get }
    func viewDidAppear()
    func searchItunesLibrary(with searchTerm: String)
}

class SearchMusicInteractorImplentation: SearchMusicInteractor {
    var selectedMediaTypes: [EntityType]?
    var presenter: SearchMusicPresenter?
    var searchService: ItunesSearchService = ItunesSearchService(itunesDataStore: ItunesDataStore())

    func viewDidAppear() {
        presenter?.interactor(didRetrieveMediaSelectedItems: selectedMediaTypes)
    }

    func searchItunesLibrary(with searchTerm: String) {
        guard let mediaTypes = selectedMediaTypes else {
            presenter?.interactor(didFailToRetrieveSearchResults: "Please select media type")
            return
        }

        searchService.searchContent(with: searchTerm, selectedEntities: mediaTypes) { [weak self] response, _ in
            guard let res = response, res.count > 0 else {
                self?.presenter?.interactor(didFailToRetrieveSearchResults: "Fail to retrieve results")
                return
            }
            self?.presenter?.interactor(didRetrieveSearchResults: res)
        }
    }
}
