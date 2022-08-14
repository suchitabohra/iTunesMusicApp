//
//  ResultInteractor.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol SearchResultsInteractor {
    var results: [String: [Any]] {get}
    func viewDidLoad()
}

class SearchResultsInteractorImplementation: SearchResultsInteractor {
    var results: [String: [Any]] = [:]
    var presenter: SearchResultsPresenter?
    func viewDidLoad() {
        presenter?.interactor(didReterieveResults: results)
    }
}
