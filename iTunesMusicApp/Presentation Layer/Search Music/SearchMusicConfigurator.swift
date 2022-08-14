//
//  SearchMusicConfigurator.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 12/08/22.
//

import Foundation
class SearchMusicConfigurator {
    static func configureModule(with selectedMediaTypes: [EntityType] = [], viewController: SearchMusicViewController) {
        let router = SearchMusicRouterImplementation()
        let interactor = SearchMusicInteractorImplentation()
        let presenter = SearchMusicPresenterImplementation()
        interactor.selectedMediaTypes = selectedMediaTypes
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
