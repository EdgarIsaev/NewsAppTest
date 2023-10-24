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
        label.text = "Dear Abby: My wife isn’t happy about what I put in my obituary"
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
        label.text = "Jeanne Phillips"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.text = "2023-10-22 08:00:19"
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
        label.text = "She suggested I write it, and now she says I'm bragging."
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
        label.text = ": Recently, my wife suggested I write my own obituary (I am almost 80) as her parents did. Because I remember dates and places she didn’t know, I drafted the document. Related Articles Everything in it is accurate, but I emphasized the positive and omitted the negative. Previous marriages? My wife thought mentioning them seemed like I was bragging, although it is factually accurate and the way I would like to be remembered. We haven’t been able to settle our differing views. What do you think? : Not everyone wants to advertise the fact that they have had multiple marriages, but facts are facts. If this is how you wish to be remembered, it is obituary. You have the deciding vote, and your wife should refrain from making any more editorial comments. : For the last six years, my partner and I have hosted family Thanksgiving dinners. I always spend more time and energy than I have to make it beautiful and successful. This year, I have neither the budget nor a desire for the stress. I made it known early that we wouldn’t be hosting this year. Surprisingly, my little sister volunteered to host, and she sent an invitation to the usual crowd. The next day, she called me to tell me that although she would host, she couldn’t possibly be expected to do all that work, and she told me to bring the turkey. She said I was free to cook it at my place or “come a bit early” to cook it there. Shocked, I told her absolutely not, because avoiding this responsibility was the reason I’m not hosting. I was planning on bringing a side or dessert as is usual for guests, but not the main dish. She got mad and said I was ruining Thanksgiving. I feel a growing responsibility to help her out, even though I don’t need the stress in my life right now, and I know once I start, I’ll take control (with her encouragement). She has no idea the amount of work that goes into this meal every year, and I think it will be a mess if I don’t help her cook and prepare. Am I being selfish? Should I go early and teach her how to cook the turkey (and do everything else) for the sake of rescuing this dinner, which everyone has come to expect meets a certain standard? Related Articles The thought is making me miserable, but I feel myself caving to my sister’s tantrum. : Tell your manipulative sister you will come to her place early and show her how to properly cook the turkey, but you won’t be bringing anything other than the side dish you already plan to bring. (This may be a way to teach her some independence.) If she needs more outside help, she should contact the other guests and tell them what she wants them to bring. You are a generous and caring sister, but enough is enough. Your Thanksgivings will be happier if you share the responsibility with other relatives. Also, remember that there are easier ways to manage holiday dinners than cooking all the food yourself. Many people buy a bird or a ham already prepared, and the same is true for the side dishes."
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
        isFavorite.toggle()
        if isFavorite {
            bookmarkButton.setImage(UIImage(named: "bookmarkTrue")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(named: "bookmarkFalse")?.withRenderingMode(.alwaysOriginal), for: .normal)
        }
        bookmarkButton.buttonGrowingEffect(bookmarkButton)
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
