//
//  GenreViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 05.05.2023.
//

import UIKit
import SnapKit

protocol GenreViewControllerProtocol: AnyObject {
    func updateView(with title: String)
    func updateCollectionView(with books: [Book])
}

class GenreViewController: UIViewController {
    var presenter: GenrePresenterProtocol?
    var collectionView: UICollectionView! = nil
    var cells = [Book]()
    
    private lazy var spinner: CustomSpinner = {
        let spinner = CustomSpinner(squareLength: 50)
        return spinner
    }()
        
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSpinner()
        presenter?.viewDidLoaded()
    }
}

// MARK: - Setup spinner
extension GenreViewController {
    func setupSpinner() {
        view.addSubview(spinner)
        spinner.startAnimation(delay: 0.04, replicates: 20)
    }
    
    func stopSpinner() {
        spinner.stopAnimation()
        spinner.removeFromSuperview()
    }
}

// MARK: - GenreViewControllerProtocol
extension GenreViewController: GenreViewControllerProtocol {
    func updateCollectionView(with books: [Book]) {
        stopSpinner()
        
        set(with: books)
            self.configureCollectionView()
    }
    
    func updateView(with title: String) {
        self.title = title
    }
    
}

//  MARK: - Layout
extension GenreViewController {
    private func createLayout() -> UICollectionViewFlowLayout{
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: Double(ScreenSize.shared().screenWidth * 0.45),
                                 height: Double(ScreenSize.shared().screenHeight * 0.29))
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        return layout
    }
}

//  MARK: - Setup Collection View
extension GenreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(BooksCollectionViewCell.self,
                                forCellWithReuseIdentifier: BooksCollectionViewCell.reuseId)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func set(with cells: [Book]) {
        self.cells = cells
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BooksCollectionViewCell.reuseId,
                                                      for: indexPath) as! BooksCollectionViewCell
        cell.title.text = cells[indexPath.row].name
        cell.authors.text = cells[indexPath.row].authors[0].first_name + " " + cells[indexPath.row].authors[0].last_name
        cell.imageView.image = UIImage(named: "book")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let infoBook = cells[indexPath.row]
        presenter?.didSelectItem(with: infoBook)
    }
    
}

