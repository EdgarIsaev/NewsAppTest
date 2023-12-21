//
//  FavoriteNewsTableView.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 02.12.2023.
//

import UIKit

protocol FavoriteNewsTableViewProtocol: AnyObject {
    func selectedCell(model: NewsModel)
}

class FavoriteNewsTableView: UITableView {
    
    weak var tableViewDelegate: FavoriteNewsTableViewProtocol?
    
    private let idFavoriteTableViewCell = "idFavoriteTableViewCell"
    
    private var newsArray = [NewsModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(FavoriteNewsTableViewCell.self, forCellReuseIdentifier: idFavoriteTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .white
        separatorStyle = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    public func getNews(model: [NewsModel]) {
        newsArray.removeAll()
        newsArray.append(contentsOf: model)
    }
}

//MARK: UITableViewDataSource

extension FavoriteNewsTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idFavoriteTableViewCell, for: indexPath) as? FavoriteNewsTableViewCell
        else { return UITableViewCell() }
        
        let model = newsArray[indexPath.row]
        cell.setupViews(model: model)
        cell.tableViewCellDelegate = tableViewDelegate as? FavoriteTableViewCellProtocol
        
        return cell
    }
}

//MARK: UITableViewDelegate

extension FavoriteNewsTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = newsArray[indexPath.row]
        tableViewDelegate?.selectedCell(model: model)
    }
}
