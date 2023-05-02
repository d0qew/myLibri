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
        textLabel.font = UIFont(name: "Menlo-Bold", size: 10)
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
        backgroundColor = UIColor.green
        
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(StructScreenSize().screenWidth * 0.3)
            make.height.equalTo(StructScreenSize().screenHeight / 5)
        }
       
        addSubview(title)
        title.snp.makeConstraints { make in
            make.centerX.equalTo(imageView.snp.centerX)
            make.centerY.equalTo(imageView.snp.centerY)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
