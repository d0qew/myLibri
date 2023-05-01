//
//  MainViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func showCollectionView()
}

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    var artisticGenreCollection = GenreCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        view.backgroundColor = .white
        presenter?.viewDidLoaded()
    }
}

//  MARK: - MainViewControllerProtocol 
extension MainViewController: MainViewControllerProtocol {
    func showCollectionView() {
        self.artisticGenreCollection.set(genresArray)
        
        self.updateDate()
        self.setupCollectionViews()
    }
    
    private func updateDate() {
        artisticGenreCollection.reloadData()
    }
    
    private func setupCollectionViews() {
        view.addSubview(artisticGenreCollection)
        artisticGenreCollection.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(150)
            make.left.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.right.equalToSuperview().inset((StructScreenSize().screenWidth - 330) / 4)
            make.bottom.equalToSuperview().inset(400)
        }
    }
}
