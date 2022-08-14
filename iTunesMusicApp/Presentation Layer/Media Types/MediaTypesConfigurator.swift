//
//  MediaTypesConfigurator.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 12/08/22.
//

import Foundation
class MediaTypesConfigurator {
    static func configureModule(viewController: MediaTypesViewController) {
        let router = MediaTypesRouterImplementation()
        let interactor = MediaTypeInteractorImplementation()
        let presenter = MediaTypesPresenterImplementation()

        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
