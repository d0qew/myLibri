//
//  GenreCollectionView.swift
//  myLibri
//
//  Created by Daniil Konashenko on 29.04.2023.
//

import UIKit

//class GenreCollectionView: UICollectionView {
//
//
//    var collectionViewLayout = {
//        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
//            guard let self = self else { return }
//            let section = self.sections[sectionIndex]
//            switch section {
//            case .artisticLiterature:
//                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(StructScreenSize().screenWidth * 0.3), heightDimension: .absolute(StructScreenSize().screenHeight / 5)), subitems: [item])
//                let section = NSCollectionLayoutSection(group: group)
//
//                return section
//            case .nonFiction:
//                return nil
//            case .childrenLiterature:
//                return nil
//            }
//        }
//    }()
//
//    init() {
//        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewLayout)
//        setDelegate()
//        setDataSource()
//        backgroundColor = UIColor.green
//        register(ArtisticLiteratureCollectionViewCell.self, forCellWithReuseIdentifier: ArtisticLiteratureCollectionViewCell.reuseId)
//        register(NonFictionCollectionViewCell.self, forCellWithReuseIdentifier: NonFictionCollectionViewCell.reuseId)
//        register(ChildrenLiteratureCollectionViewCell.self, forCellWithReuseIdentifier: ChildrenLiteratureCollectionViewCell.reuseId)
//
//        register(GenreCollectionViewHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GenreCollectionViewHeaderReusableView.reuseId)
//        alwaysBounceHorizontal = true
//        showsHorizontalScrollIndicator = false
//        showsVerticalScrollIndicator = false
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//// MARK: UICollectionViewDelegate
//extension GenreCollectionView: UICollectionViewDelegate {
//    func setDelegate() {
//        delegate = self
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sections[section].count
//    }
//
//    }
//// MARK: UICollectionViewDataSource
//extension GenreCollectionView: UICollectionViewDataSource {
//    func setDataSource(){
//        dataSource = self
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch sections[indexPath.section] {
//        case .artisticLiterature(let items):
//            let cell = dequeueReusableCell(withReuseIdentifier: ArtisticLiteratureCollectionViewCell.reuseId, for: indexPath) as! ArtisticLiteratureCollectionViewCell
//            cell.imageView = UIImageView(image: UIImage(named: items[indexPath.row].image))
//            cell.title.text = items[indexPath.row].title
//            return cell
//        case .nonFiction(let items):
//            let cell = dequeueReusableCell(withReuseIdentifier: NonFictionCollectionViewCell.reuseId, for: indexPath) as! NonFictionCollectionViewCell
//            cell.imageView = UIImageView(image: UIImage(named: items[indexPath.row].image))
//            cell.title.text = items[indexPath.row].title
//            return cell
//        case .childrenLiterature(let items):
//            let cell = dequeueReusableCell(withReuseIdentifier: ChildrenLiteratureCollectionViewCell.reuseId, for: indexPath) as! ChildrenLiteratureCollectionViewCell
//            cell.imageView = UIImageView(image: UIImage(named: items[indexPath.row].image))
//            cell.title.text = items[indexPath.row].title
//            return cell
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GenreCollectionViewHeaderReusableView.reuseId, for: indexPath) as! GenreCollectionViewHeaderReusableView
//            header.title.text = sections[indexPath.section].title
//            return header
//        default:
//            return UICollectionReusableView()
//        }
//    }
//}
//
//// MARK: UICollectionViewDelegateFlowLayout
//extension GenreCollectionView: UICollectionViewDelegateFlowLayout {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        return CGSize(width: 130, height: 172)
////    }
//}
