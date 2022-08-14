//
//  MediaTypeViewController+Stub.swift
//  iTunesMusicAppTests
//
//  Created by Suchita Bohra on 13/08/22.
//

@testable import iTunesMusicApp
import Quick
import Nimble

extension MediaTypesViewController {
    static func stub(isMock: Bool = false) -> MediaTypesViewController? {
        let window: UIWindow!
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MediaTypesViewController") as? MediaTypesViewController else {
            return nil
        }
        MediaTypesConfigurator.configureModule(viewController: viewController)
        window = UIWindow(frame: UIScreen.main.bounds)
        window.addSubview(viewController.view)
        viewController.beginAppearanceTransition(true, animated: false)
        viewController.endAppearanceTransition()
        return viewController
    }
}
