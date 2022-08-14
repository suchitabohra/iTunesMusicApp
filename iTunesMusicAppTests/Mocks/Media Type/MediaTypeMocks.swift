//
//  MediaTypeMocks.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

class MediaTypesRouterImplementationMock: MediaTypesRouter {
    var navigationController: UINavigationController?
    var isRouteBackToSearchScreen = false
    func routeBackToSearchMusic(with selectedItems: [EntityType]) {
        isRouteBackToSearchScreen = true
    }
}
