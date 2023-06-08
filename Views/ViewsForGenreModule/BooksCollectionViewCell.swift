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
        textLabel.textColor = UIColor.black
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
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        layer.cornerRadius = 15
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(ScreenSize.shared().screenWidth * 0.45 - 20)
            make.height.equalTo(ScreenSize.shared().screenWidth * 0.62)
        }
        
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).inset(-7)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        addSubview(authors)
        authors.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(10)
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
}

