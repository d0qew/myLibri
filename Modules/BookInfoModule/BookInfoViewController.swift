//
//  BookInfoViewController.swift
//  myLibri
//
//  Created by Daniil Konashenko on 19.05.2023.
//

import UIKit
import SnapKit

protocol BookInfoViewControllerProtocol: AnyObject {
    func updateInfoBook(book: Book, image: UIImage?) async
}

class BookInfoViewController: UIViewController {
    var presenter: BookInfoPresenterProtocol?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.frame = view.bounds
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemBackground
        contentView.frame = scrollView.bounds
        return contentView
    }()
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let content = scrollView.subviews.reduce(CGRect.zero) {
            $0.union($1.frame)
        }
        scrollView.contentSize = content.size
    }
}

//  MARK: - BookInfoViewControllerProtocol
@MainActor
extension BookInfoViewController: BookInfoViewControllerProtocol {
    func updateInfoBook(book: Book, image: UIImage?) {
        descriptionLabel.text = "Описание:"
        
        titleBook.text = book.name
        authorBook.text = "Автор: " + book.authors[0].first_name + " " + book.authors[0].last_name
        imageViewBook.image = image
        descriptionBook.text = book.description
        publisherBook.text = "Издатель: " + book.publisher
        
        configureViews()
    }
    
}

//MARK: - Layout
extension BookInfoViewController {
    private func configureViews() {
        titleBook.font = UIFont.boldSystemFont(ofSize: 22)
        titleBook.textAlignment = .left
        titleBook.numberOfLines = 0
        titleBook.adjustsFontSizeToFitWidth = false
        titleBook.lineBreakMode = .byClipping
        
        authorBook.font = UIFont.systemFont(ofSize: 18)
        authorBook.textAlignment = .left
        authorBook.numberOfLines = 0
        authorBook.adjustsFontSizeToFitWidth = false
        authorBook.lineBreakMode = .byClipping
        
        imageViewBook.contentMode = .scaleAspectFit
        imageViewBook.clipsToBounds = true
        
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 20)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = false
        descriptionLabel.lineBreakMode = .byClipping
        
        descriptionBook.font = UIFont.systemFont(ofSize: 16)
        descriptionBook.textAlignment = .justified
        descriptionBook.numberOfLines = 0
        descriptionBook.adjustsFontSizeToFitWidth = false
        descriptionBook.lineBreakMode = .byClipping
        
        publisherBook.font = UIFont.systemFont(ofSize: 16)
        publisherBook.textAlignment = .right
        publisherBook.numberOfLines = 0
        publisherBook.adjustsFontSizeToFitWidth = false
        publisherBook.lineBreakMode = .byClipping
        
        dowloadBook.setTitle("Скачать книгу", for: .normal)
        dowloadBook.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        dowloadBook.setTitleColor(.label, for: .normal)
        dowloadBook.setTitleColor(.gray, for: .selected)
        dowloadBook.layer.borderColor = UIColor.label.cgColor
        dowloadBook.layer.borderWidth = 3
        dowloadBook.layer.cornerRadius = 15
        dowloadBook.backgroundColor = .clear
        dowloadBook.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.addSubview(titleBook)
        titleBook.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(authorBook)
        authorBook.snp.makeConstraints { make in
            make.top.equalTo(titleBook.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        contentView.addSubview(imageViewBook)
        imageViewBook.snp.makeConstraints { make in
            make.top.equalTo(authorBook.snp.bottom).inset(-5)
            make.leading.trailing.equalToSuperview().inset(15)
            make.width.equalTo(view.frame.width - 30)
            make.height.equalTo(view.frame.width * 1.42)
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
            make.bottom.equalToSuperview().inset(30)
        }
    }
    
    @objc func tapButton() {
        presenter?.buttonTapped()
    }
}
