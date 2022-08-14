//
//  ResultDetailConfigurator.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 13/08/22.
//

import Foundation
class ResultDetailConfigurator {
    static func configureModule(with selectedMedia: Any, entity: EntityType, viewController: ResultDetailViewController) {
        let router = ResultDetailRouter()
        let interactor = ResultDetailInteractorImplementation()
        let presenter = ResultDetailPresenterImplementation()
        interactor.selectedMediaObject = selectedMedia
        interactor.entityType = entity
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.navigationController = viewController.navigationController
    }
}
