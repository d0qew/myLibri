//
//  GenreCollectionViewHeaderReusableView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 02.05.2023.
//

import UIKit
import SnapKit

class GenreCollectionViewHeaderReusableView: UICollectionReusableView {
    static let reuseId = "GenreCollectionViewHeaderReusableView"
    
    var title: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layouts
extension GenreCollectionViewHeaderReusableView {
    private func setupLayouts() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
