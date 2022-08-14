//
//  AppDelegate.swift
//  iTunesMusicApp
//
//  Created by Suchita Bohra on 09/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let searchVC = mainStoryboard.instantiateViewController(withIdentifier: "SearchMusicViewController") as? SearchMusicViewController else {
            return false
        }
        let navigationController = UINavigationController(rootViewController: searchVC)
        SearchMusicConfigurator.configureModule(viewController: searchVC)
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
