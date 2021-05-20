//
//  SceneDelegate.swift
//  SequeniaFilms
//
//  Created by OnlyFrenzy on 19.05.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var coordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        window?.rootViewController = UINavigationController()
        coordinator = DefaultCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        coordinator?.start()
        window?.makeKeyAndVisible()
    }
}

