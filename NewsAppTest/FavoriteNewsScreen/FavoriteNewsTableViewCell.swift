//
//  FavoriteNewsTableViewCell.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import UIKit

protocol FavoriteTableViewCellProtocol: AnyObject {
    func bookmarkButtonTapped(title: String)
}

class FavoriteNewsTableViewCell: UITableViewCell {
    
    weak var tableViewCellDelegate: FavoriteTableViewCellProtocol?
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bookmarkTrue")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let lineView: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    private let descriptionLabel: UILabel = {
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
    
    private var realmModel = NewsModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        backgroundColor = .white
        selectionStyle = .none
        
        contentView.addSubview(bookmarkButton)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(dateLabel)
        addSubview(descriptionLabel)
        addSubview(lineView)
    }
    
    @objc private func bookmarkButtonTapped() {
        tableViewCellDelegate?.bookmarkButtonTapped(title: titleLabel.text ?? "")
    }
    
    public func changeBookmarkImage() {
        bookmarkButton.setImage(UIImage(named: "bookmarkFalse")?.withRenderingMode(.alwaysOriginal), for: .normal)
        viewGrowingEffect(bookmarkButton)
    }
    
    public func setupViews(model: NewsModel) {
        titleLabel.text = model.title
        authorLabel.text = model.author
        dateLabel.text = model.date
        descriptionLabel.text = model.descript
        realmModel =  model
    }
}

//MARK: SetConstraints

extension FavoriteNewsTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            bookmarkButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            bookmarkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 30),
            bookmarkButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 80),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -10),
            authorLabel.heightAnchor.constraint(equalToConstant: 22),
            
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            dateLabel.trailingAnchor.constraint(equalTo: bookmarkButton.leadingAnchor, constant: -10),
            dateLabel.heightAnchor.constraint(equalToConstant: 17),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: lineView.topAnchor, constant: -10),
            
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
