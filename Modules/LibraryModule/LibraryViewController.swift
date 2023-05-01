//
//  LibraryViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol LibraryViewControllerProtocol: AnyObject {
    
}

class LibraryViewController: UIViewController {
    var presenter: LibraryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Библиотека"
        view.backgroundColor = .white
        presenter?.viewDidLoaded()
    }
}



//  MARK: LibraryViewControllerProtocol
extension LibraryViewController: LibraryViewControllerProtocol {
    
}
