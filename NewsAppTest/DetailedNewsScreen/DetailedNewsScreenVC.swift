//
//  DetailedNewsScreenVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import Foundation
import UIKit

class DetailedNewsScreenVC: UIViewController {
    
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
        label.text = "Ask Amy: Had we known about this upheaval, we would have declined the wedding invitation"
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
        label.text = "Albert Bassili"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.text = "2023-10-22 09:20:26"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "If you don't want to spend nearly $500 on a Dyson Supersonic, this Shark alternative will net you a similar premium experience for just $160."
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
        label.text = "Shark There are a lot of different hair dryers out there, but you’re probably familiar with Dyson’s expensive hair dryer, the Supersonic, which often goes for $500 or so, at least if you include all the accessories. Even though the Dyson might use some really interesting technology that puts it out of reach for many folks. Luckily, there is an alternative, the Shark HyperAir hair dryer, which doesn’t use the same technology but has a look, feel, and overall outcome similar to the Dyson Supersonic. Even better, it’s much cheaper, especially with this deal from Amazon knocking it down to $160 from its usual $230 price tag. That’s a significant $70 discount on an excellent hair dryer, so even though it’s not the Dyson Supersonic, it’s almost as good for nearly a quarter of the price. Why you should buy the Shark HyperAIR Hair Dryer The Shark HyperAIR doesn’t use a bladeless design but instead combines hot and ionized air to help speed up the drying process and avoid hair damage, as the Dyson does. In fact, it even has an internal processor that adjusts the air temperature up to 1,000 times per second, which is impressive and creates a consistent heat temperature throughout use. It also has a couple of sensors that can detect your hairstyle and automatically adjust heat and air strength to get the best of both worlds. That said, you can still adjust it yourself if you like, with three different heat levels and three different airflow levels, giving you a lot of granular control over how you style your hair. Speaking of styling, the Shark HyperAIR comes with two different attachments: the 2-in-1 concentrator to dry and style your hair and a diffuser to help define your curls better. The diffusers and the HyperAIR unit combine to give you some really consistent styling, something that you won’t find on more budget-oriented hair dryers and that you’d pay a premium for if you bought the Dyson. Related Dyson’s new Airstrait hair straightener just got an unprecedented price cut Best Buy’s best deal is an air fryer for $18 — but it ends tonight Amazon’s Keurig alternative is incredibly cheap today Overall, the Shark HyperAIR is an excellent all-around hair dryer that offers a premium style experience at more reasonable prices. You can pick it up right now from Amazon for just $160 instead of the usual $230, although if you’d still like something a bit different, there are some other great hair dryer deals you can check out. Editors' Recommendations Huge smart lighting sale gets you a smart bulb from $8 Pet Odors Be Gone: This top-rated Shark air purifier is 38% off A bunch of Black Friday cordless vacuum deals are now live — From $68 Great for large rooms: This air purifier is discounted from $200 to $90 The Arlo Pro 4 security camera bundle is 50% off today"
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight:.regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
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
    
    @objc private func backButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func bookmarkButtonTapped() {
        print("bookmarkButtonTapped")
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
