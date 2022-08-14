//
//  ResultPresenter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol SearchResultsPresenter {
    func interactor(didReterieveResults result: [String: [Any]])
}

class SearchResultsPresenterImplementation: SearchResultsPresenter {
    weak var viewController: SearchResultsPresenterOutput?
    func interactor(didReterieveResults result: [String: [Any]]) {
        viewController?.presenter(didRetrieveResult: result)
    }
}
