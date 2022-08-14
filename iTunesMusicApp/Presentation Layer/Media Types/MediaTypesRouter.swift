//
//  MediaTypeSelectorRouter.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 10/08/22.
//

import UIKit

protocol MediaTypesRouter {
    var navigationController: UINavigationController? { get }
    func routeBackToSearchMusic(with selectedItems: [EntityType])
}

class MediaTypesRouterImplementation: MediaTypesRouter {
    weak var navigationController: UINavigationController?
    func routeBackToSearchMusic(with selectedItems: [EntityType]) {
        let searchMusicVC = navigationController?.viewControllers.first as! SearchMusicViewController
        SearchMusicConfigurator.configureModule(with: selectedItems, viewController: searchMusicVC)
        navigationController?.popToViewController(searchMusicVC, animated: true)
    }
}
