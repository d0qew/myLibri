//
//  GenreCollectionViewCell.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit
import SnapKit

class GenreCollectionViewCell: UICollectionViewCell {
    static let reuseId = "GenreCollectionViewCell"
    
    var title: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = UIFont(name: "Menlo", size: 20)
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
        initialize()
    }
    
    private func initialize() {
//        backgroundColor = UIColor.clear
//        layer.cornerRadius = 15
//        layer.borderColor = UIColor.white.cgColor
//        layer.borderWidth = 3
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
        }
       
        
        addSubview(title)
        title.snp.makeConstraints { make in
            
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
