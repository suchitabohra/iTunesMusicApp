//
//  SearchRouter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol SearchMusicRouter: AnyObject {
    var navigationController: UINavigationController? { get }
    func routeToMediaTypeSelection()
    func routeToSearchResults(with results: [String: [Any]])
}

class SearchMusicRouterImplementation: SearchMusicRouter {

    var navigationController: UINavigationController?
    func routeToMediaTypeSelection() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MediaTypesViewController") as? MediaTypesViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
        MediaTypesConfigurator.configureModule(viewController: viewController)
    }

    func routeToSearchResults(with results: [String: [Any]]) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as? SearchResultsViewController else {
            return
        }
        navigationController?.pushViewController(viewController, animated: true)
        SearchResultConfigurator.configureModule(with: results, viewController: viewController)
    }

}
