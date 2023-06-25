//
//  TabBarController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateNVC(
                viewController: MainAssembly.configure(),
                title: "Главная",
                image: UIImage(systemName: "book")
            ),
            generateNVC(
                viewController: LibraryAssembly.configure(),
                title: "Библиотека",
                image: UIImage(systemName:"books.vertical")
            )
        ]
    }
    
    private func generateNVC(viewController: UIViewController,
                             title: String, image: UIImage?
    ) -> UIViewController {
        
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.navigationBar.barStyle = .default
        navigationVC.navigationBar.prefersLargeTitles = true
        navigationVC.navigationItem.largeTitleDisplayMode = .automatic
        
        return navigationVC
    }
    
}
