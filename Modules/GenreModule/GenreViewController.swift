//
//  GenreViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit
import SnapKit

protocol GenreViewControllerProtocol: AnyObject {
    
}

class GenreViewController: UIViewController {
    var presenter: GenrePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoaded()
    }
}



// MARK: - GenreViewControllerProtocol
extension GenreViewController: GenreViewControllerProtocol {
    
}
