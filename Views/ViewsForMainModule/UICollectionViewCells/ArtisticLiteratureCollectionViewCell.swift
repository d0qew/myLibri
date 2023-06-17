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
        
        return textLabel
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
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
extension ArtisticLiteratureCollectionViewCell {
    private func setupLayouts() {
        backgroundColor = UIColor(
            red: 245/255,
            green: 245/255,
            blue: 245/255,
            alpha: 1
        )
        layer.cornerRadius = 15
        clipsToBounds = true
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.size.equalTo(ScreenSize.shared().screenWidth * 0.3)
        }
       
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
        }
    }
    
}
