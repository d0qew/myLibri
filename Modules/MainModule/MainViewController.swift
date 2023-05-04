//
//  MainViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 27.04.2023.
//

import UIKit
import SnapKit

protocol MainViewControllerProtocol: AnyObject {
    func showCollectionView()
}

class MainViewController: UIViewController {
    var presenter: MainPresenterProtocol?
    var collectionView: UICollectionView! = nil
    
    var sections = GenreData.shared.pageData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
        view.backgroundColor = .systemBackground
        configureCollectionView()
        presenter?.viewDidLoaded()
    }
}

//  MARK: - MainViewControllerProtocol
extension MainViewController: MainViewControllerProtocol {
    func showCollectionView() {
        self.updateDate()
        
    }
    
    private func updateDate() {
        collectionView.reloadData()
    }
}

//  MARK: - Layout
extension MainViewController {
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self = self else { return nil }
            let section = self.sections[sectionIndex]
            switch section {
            case .artisticLiterature:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.9 * 0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 5, leading: 15, bottom: 15, trailing: 15)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
                
            case .nonFiction:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.9 * 0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 5, leading: 15, bottom: 15, trailing: 15)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
                
            case .childrenLiterature:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalWidth(0.9 * 0.6))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.interGroupSpacing = 10
                section.contentInsets = .init(top: 5, leading: 15, bottom: 15, trailing: 15)
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                
                return section
            }
        }
    }
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize:.init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}

//  MARK: - Setup Collection View
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(ArtisticLiteratureCollectionViewCell.self, forCellWithReuseIdentifier: ArtisticLiteratureCollectionViewCell.reuseId)
        collectionView.register(NonFictionCollectionViewCell.self, forCellWithReuseIdentifier: NonFictionCollectionViewCell.reuseId)
        collectionView.register(ChildrenLiteratureCollectionViewCell.self, forCellWithReuseIdentifier: ChildrenLiteratureCollectionViewCell.reuseId)
        collectionView.register(GenreCollectionViewHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GenreCollectionViewHeaderReusableView.reuseId)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .artisticLiterature(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ArtisticLiteratureCollectionViewCell.reuseId, for: indexPath) as! ArtisticLiteratureCollectionViewCell
            cell.imageView.image = items[indexPath.row].image
            cell.title.text = items[indexPath.row].title
            return cell
        case .nonFiction(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NonFictionCollectionViewCell.reuseId, for: indexPath) as! NonFictionCollectionViewCell
            cell.imageView.image = items[indexPath.row].image
            cell.title.text = items[indexPath.row].title
            return cell
        case .childrenLiterature(let items):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildrenLiteratureCollectionViewCell.reuseId, for: indexPath) as! ChildrenLiteratureCollectionViewCell
            cell.imageView.image = items[indexPath.row].image
            cell.title.text = items[indexPath.row].title
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GenreCollectionViewHeaderReusableView.reuseId, for: indexPath) as! GenreCollectionViewHeaderReusableView
            header.title.text = sections[indexPath.section].title
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
