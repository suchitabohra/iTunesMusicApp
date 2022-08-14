//
//  SearchPresenter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import Foundation

protocol SearchMusicPresenter {
    func interactor(didRetrieveMediaSelectedItems items: [EntityType]?)
    func interactor(didFailToRetrieveSearchResults error: String)
    func interactor(didRetrieveSearchResults results: [String: [Any]])
}

class SearchMusicPresenterImplementation: SearchMusicPresenter {
    weak var viewController: SearchMusicPresenterOutput?

    func interactor(didRetrieveSearchResults results: [String: [Any]]) {
        viewController?.presenter(didRetrieveSearchResults: results)
    }

    func interactor(didFailToRetrieveSearchResults error: String) {
        viewController?.presenter(didFailToRetrieveSearchResults: error)
    }

    func interactor(didRetrieveMediaSelectedItems items: [EntityType]?) {
        viewController?.presenter(didRetrieveMediaSelectedItems: items ?? [])
    }
}
