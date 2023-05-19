//
//  BookInfoViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit
import SnapKit

protocol BookInfoViewControllerProtocol: AnyObject {
    
}

class BookInfoViewController: UIViewController {
    var presenter: BookInfoPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Библиотека"
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoaded()
    }
}



//  MARK: - BookInfoViewControllerProtocol
extension BookInfoViewController: BookInfoViewControllerProtocol {
    
}
