//
//  SceneDelegate.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene as! UIWindowScene)
        let movieViewController = MoviesDisplayView()
        window?.rootViewController = movieViewController
        window?.makeKeyAndVisible()
    }
}
