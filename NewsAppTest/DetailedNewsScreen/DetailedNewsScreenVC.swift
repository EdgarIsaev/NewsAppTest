//
//  DetailedNewsScreenVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import UIKit

import UIKit

class DetailedNewsScreenVC: UIViewController {
    
    private var isFavorite: Bool = false
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bookmarkFalse")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight:.medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
       let label = UILabel()
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight:.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(backButton)
        contentView.addSubview(bookmarkButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(contentLabel)
    }
    
    private func hideOrShowImage() {
        if imageView.image == nil {
            imageView.heightAnchor.constraint(equalToConstant: 0).isActive = true
        } else {
            imageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        }
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func bookmarkButtonTapped() {
        isFavorite.toggle()
        if isFavorite {
            bookmarkButton.setImage(UIImage(named: "bookmarkTrue")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(named: "bookmarkFalse")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        bookmarkButton.buttonGrowingEffect(bookmarkButton)
    }
    
    public func setupViews(model: NetworkModel) {
        titleLabel.text = model.title
        authorLabel.text = model.creator?[0]
        dateLabel.text = model.pubDate
        descriptionLabel.text = model.description
        contentLabel.text = model.content
        
        NetworkImageRequest.shared.imageFetch(imageUrl: model.imageURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
                
            case .success(let image):
                self.imageView.image = image
                hideOrShowImage()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}

extension DetailedNewsScreenVC {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
        
            backButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            bookmarkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bookmarkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: bookmarkButton.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            imageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            contentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
