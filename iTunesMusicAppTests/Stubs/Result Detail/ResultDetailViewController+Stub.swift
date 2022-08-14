//
//  ResultDetailViewController+Stub.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 14/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

extension ResultDetailViewController {
    static func stub(with selectedMedia: Any = HelperFunctions.getAlbumArray(), entity: EntityType = .album) -> ResultDetailViewController? {
        let window: UIWindow!
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ResultDetailViewController") as? ResultDetailViewController else {
            return nil
        }
        ResultDetailConfigurator.configureModule(with: selectedMedia, entity: entity, viewController: viewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(viewController.view)
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        return viewController
    }
}
