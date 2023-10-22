//
//  FavoriteNewsTableView.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import UIKit

protocol FavoriteTableViewProtocol: AnyObject {
    func cellTapped()
}

class FavoriteNewsTableView: UITableView {
    
    weak var favoriteTableViewDelegate: FavoriteTableViewProtocol?
    
    private let idFavoriteTableViewCell = "idFavoriteTableViewCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        register(FavoriteNewsTableViewCell.self, forCellReuseIdentifier: idFavoriteTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        separatorStyle = .none
        
        dataSource = self
        delegate = self
    }
    
    @objc private func cellTapped() {
        favoriteTableViewDelegate?.cellTapped()
    }
    
}

//MARK: UITableViewDataSource

extension FavoriteNewsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idFavoriteTableViewCell, for: indexPath) as? FavoriteNewsTableViewCell
        else { return UITableViewCell() }
        
        let tapCell = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        tapCell.cancelsTouchesInView = true
        cell.contentView.addGestureRecognizer(tapCell)
        
        return cell
    }
}

//MARK: UITableViewDelegate

extension FavoriteNewsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}
