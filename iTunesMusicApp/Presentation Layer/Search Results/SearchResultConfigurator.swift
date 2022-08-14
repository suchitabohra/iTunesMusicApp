//
//  SearchResultConfigurator.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 12/08/22.
//

import Foundation
class SearchResultConfigurator {
    static func configureModule(with results: [String: [Any]], viewController: SearchResultsViewController) {
        let router = SearchResultsRouterImplementation()
        let interactor = SearchResultsInteractorImplementation()
        let presenter = SearchResultsPresenterImplementation()
        interactor.results = results
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
