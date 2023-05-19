//
//  BookInfoViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit
import SnapKit

protocol BookInfoViewControllerProtocol: AnyObject {
    func updateInfoBook(book: Book)
    func updateImage(image: UIImage?)
}

class BookInfoViewController: UIViewController {
    var presenter: BookInfoPresenterProtocol?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height * 0.9)
    }
    
    var titleBook =  UILabel()
    var authorBook = UILabel()
    var genreBook = UILabel()
    var imageViewBook = UIImageView()
    var descriptionBook = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Книга"
        view.backgroundColor = .systemBackground
        presenter?.viewDidLoaded()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
                               
        contentView.addSubview(titleBook)
        titleBook.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(authorBook)
        authorBook.snp.makeConstraints { make in
            make.top.equalTo(titleBook.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
    }

    private func configureViews() {
        titleBook.font = UIFont.boldSystemFont(ofSize: 22)
        titleBook.textAlignment = .left
        titleBook.numberOfLines = 0
        titleBook.adjustsFontSizeToFitWidth = false
        titleBook.lineBreakMode = .byClipping
        titleBook.translatesAutoresizingMaskIntoConstraints = false
        
        authorBook.font = UIFont.systemFont(ofSize: 18)
        authorBook.textAlignment = .left
        authorBook.numberOfLines = 0
        authorBook.adjustsFontSizeToFitWidth = false
        authorBook.lineBreakMode = .byClipping
        authorBook.translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
    }
    
    private func setupImage() {
        contentView.addSubview(imageViewBook)
        imageViewBook.snp.makeConstraints { make in
            make.top.equalTo(authorBook.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
            make.size.equalTo(StructScreenSize.shared.screenWidth - 30)
        }
        
        contentView.addSubview(descriptionBook)
        descriptionBook.snp.makeConstraints { make in
            make.top.equalTo(imageViewBook.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
    private func configureImage() {
        imageViewBook.translatesAutoresizingMaskIntoConstraints = false
        imageViewBook.contentMode = .scaleAspectFit
        imageViewBook.clipsToBounds = true
        
        descriptionBook.font = UIFont.systemFont(ofSize: 16)
        descriptionBook.textAlignment = .justified
        descriptionBook.numberOfLines = 0
        descriptionBook.adjustsFontSizeToFitWidth = false
        descriptionBook.lineBreakMode = .byClipping
        descriptionBook.translatesAutoresizingMaskIntoConstraints = false
        
        setupImage()
    }
}

//  MARK: - BookInfoViewControllerProtocol
extension BookInfoViewController: BookInfoViewControllerProtocol {
    func updateInfoBook(book: Book) {
        titleBook.text = book.name
        authorBook.text = book.authors[0].first_name + " " + book.authors[0].last_name
        descriptionBook.text = book.description
        
        configureViews()
    }
    
    func updateImage(image: UIImage?){
        DispatchQueue.main.async {
            self.imageViewBook.image = image
            self.configureImage()
        }
    }
}

// MARK: - Scroll View
extension BookInfoViewController {
    
}
