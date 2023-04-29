//
//  GenreCollectionView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

class GenreCollectionView: UICollectionView {
    var cells = [GenreForView]()
    var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: self.layout)
        setDelegate()
        setDataSource()
        backgroundColor = UIColor.clear
        register(GenreCollectionViewCell.self, forCellWithReuseIdentifier: GenreCollectionViewCell.reuseId)
        translatesAutoresizingMaskIntoConstraints = false
        alwaysBounceHorizontal = true
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    func set(_ cells:[GenreForView]) {
        self.cells = cells
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UICollectionViewDelegate
extension GenreCollectionView: UICollectionViewDelegate {
    func setDelegate() {
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        return cell
    }
}

// MARK: UICollectionViewDataSource
extension GenreCollectionView: UICollectionViewDataSource {
    func setDataSource(){
        dataSource = self
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension GenreCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 120)
    }
}
