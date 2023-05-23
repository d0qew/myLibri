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
    var descriptionLabel = UILabel()
    var descriptionBook = UILabel()
    var publisherBook = UILabel()
    var dowloadBook = UIButton()
    
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
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageViewBook.snp.bottom).inset(-10)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(descriptionBook)
        descriptionBook.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(publisherBook)
        publisherBook.snp.makeConstraints { make in
            make.top.equalTo(descriptionBook.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(dowloadBook)
        dowloadBook.snp.makeConstraints { make in
            make.top.equalTo(publisherBook.snp.bottom).inset(-20)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    private func configureImage() {
        imageViewBook.translatesAutoresizingMaskIntoConstraints = false
        imageViewBook.contentMode = .scaleAspectFit
        imageViewBook.clipsToBounds = true
        
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = false
        descriptionLabel.lineBreakMode = .byClipping
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionBook.font = UIFont.systemFont(ofSize: 16)
        descriptionBook.textAlignment = .justified
        descriptionBook.numberOfLines = 0
        descriptionBook.adjustsFontSizeToFitWidth = false
        descriptionBook.lineBreakMode = .byClipping
        descriptionBook.translatesAutoresizingMaskIntoConstraints = false
        
        publisherBook.font = UIFont.systemFont(ofSize: 16)
        publisherBook.textAlignment = .right
        publisherBook.numberOfLines = 0
        publisherBook.adjustsFontSizeToFitWidth = false
        publisherBook.lineBreakMode = .byClipping
        publisherBook.translatesAutoresizingMaskIntoConstraints = false
        
        dowloadBook.setTitle("Скачать книгу", for: .normal)
        dowloadBook.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dowloadBook.setTitleColor(.label, for: .normal)
        dowloadBook.setTitleColor(.gray, for: .selected)
        dowloadBook.layer.borderColor = UIColor.label.cgColor
        dowloadBook.layer.borderWidth = 3
        dowloadBook.layer.cornerRadius = 15
        dowloadBook.backgroundColor = .clear
        dowloadBook.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        setupImage()
    }
    
    @objc func tapButton() {
        presenter?.buttonTapped()
    }
    
}

//  MARK: - BookInfoViewControllerProtocol
extension BookInfoViewController: BookInfoViewControllerProtocol {
    func updateInfoBook(book: Book) {
        descriptionLabel.text = "Описание:"
        
        titleBook.text = book.name
        authorBook.text = "Автор: " + book.authors[0].first_name + " " + book.authors[0].last_name
        descriptionBook.text = book.description
        publisherBook.text = "Издатель: " + book.publisher
        
        configureViews()
    }
    
    func updateImage(image: UIImage?){
        imageViewBook.image = image
        configureImage()
    }
    
}


