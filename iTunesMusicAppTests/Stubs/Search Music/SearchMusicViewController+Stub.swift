//
//  SearchMusicViewController+Stub.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

extension SearchMusicViewController {
    static func stub(isMock: Bool = false) -> SearchMusicViewController? {
        let window: UIWindow!
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchVC = mainStoryboard.instantiateViewController(withIdentifier: "SearchMusicViewController") as? SearchMusicViewController else {
            return nil
        }
        if isMock {
            SearchMusicConfigurator.configureMockModule(with: [EntityType.album, EntityType.song], viewController: searchVC)
        } else {
            SearchMusicConfigurator.configureModule(with: [EntityType.album, EntityType.song], viewController: searchVC)
        }
        window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(searchVC.view)
        searchVC.beginAppearanceTransition(true, animated: false)
        searchVC.endAppearanceTransition()
        return searchVC
    }
}
