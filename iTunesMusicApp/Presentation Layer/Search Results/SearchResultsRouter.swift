//
//  SearchResultsRouter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 11/08/22.
//

import UIKit

protocol SearchResultsRouter {
    var navigationController: UINavigationController? {get}
    func routeToDetail(selectedMediaObject: Any, with entity: EntityType)
}

class SearchResultsRouterImplementation: SearchResultsRouter {
    weak var navigationController: UINavigationController?
    func routeToDetail(selectedMediaObject: Any, with entity: EntityType) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ResultDetailViewController") as? ResultDetailViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
        ResultDetailConfigurator.configureModule(with: selectedMediaObject, entity: entity, viewController: viewController)
    }
}
