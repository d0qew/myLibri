//
//  ArtisticLiteratureCollectionViewCell.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit
import SnapKit

class ArtisticLiteratureCollectionViewCell: UICollectionViewCell {
    static let reuseId = "ArtisticLiteratureCollectionViewCell"
    
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
        backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1 )
        layer.cornerRadius = 15
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().inset(5)
            make.centerY.equalToSuperview().inset(5)
            make.size.equalTo(StructScreenSize().screenWidth * 0.3)
        }
       
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
