//
//  AppDelegate.swift
//  TMDBMovies
//
//  Created by Ariadna Cecilia López Colín on 01/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = MoviesDisplayView()
        let navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, didFinishLaunchingWith launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Inicializa la ventana
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Crea el ViewController que deseas mostrar
        let viewController = MoviesDisplayView() // Cambia esto por tu ViewController
        
        // Establece el rootViewController
        window?.rootViewController = viewController
        
        // Haz que la ventana sea visible
        window?.makeKeyAndVisible()
        
        return true
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

