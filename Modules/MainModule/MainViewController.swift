//
//  MainViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    
}

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        view.backgroundColor = .white
        presenter?.viewDidLoaded()
    }
}

//  MARK: MainViewControllerProtocol
extension MainViewController: MainViewControllerProtocol {
    
}
