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
        
        // Inicializamos la ventana principal
        window = UIWindow(windowScene: scene as! UIWindowScene)
        
        // Creamos una instancia de la vista principal (MovieViewController)
        let movieViewController = MoviesDisplayView()
        
        // Establecemos el controlador de vista raíz
        window?.rootViewController = movieViewController
        
        // Hacemos visible la ventana
        window?.makeKeyAndVisible()
    }

    // Otros métodos de escena que puedes mantener sin cambios.
}
