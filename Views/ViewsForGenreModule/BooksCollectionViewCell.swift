//
//  BooksCollectionViewCell.swift
//  myLibri
//
//  Created by Daniil Konashenko on 18.05.2023.
//

import UIKit
import SnapKit

class BooksCollectionViewCell: UICollectionViewCell {
    static let reuseId = "BooksCollectionViewCell"
    
    var title: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = false
        textLabel.lineBreakMode = .byClipping
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var authors: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.lightGray
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = false
        textLabel.lineBreakMode = .byClipping
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - setup Layouts
extension BooksCollectionViewCell {
    private func setupLayouts() {
        backgroundColor = UIColor.clear

        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView).inset(20)
            make.leading.equalTo(imageView).inset(20)
            make.trailing.equalTo(imageView).inset(20)
        }
        
        addSubview(authors)
        authors.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(imageView).inset(20)
            make.leading.equalTo(imageView).inset(20)
            make.trailing.equalTo(imageView).inset(20)
        }
    }
    
}

