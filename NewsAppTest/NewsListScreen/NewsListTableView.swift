//
//  NewsListTableView.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 02.12.2023.
//

import UIKit

protocol NewsListTableViewProtocol: AnyObject {
    func selectedCell(model: NetworkModel)
}

class NewsListTableView: UITableView {
    
    weak var newsListTableViewDelegate: NewsListTableViewProtocol?
    
    private var newsArray = [NetworkModel]()
    
    private let idTableViewCell = "idTableViewCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(NewsListTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
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
    
    private func getSameModel(model: NetworkModel) -> Bool {
        let results = RealmManager.shared.getResultsNewsModel()
        
        for result in results {
            if result.title == model.title {
                return true
            }
        }
        return false
    }
    
    public func getNews(models: [NetworkModel]) {
        newsArray.append(contentsOf: models)
    }
    
}

//MARK: UITableViewDataSource

extension NewsListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? NewsListTableViewCell
        else { return UITableViewCell() }
        
        let model = newsArray[indexPath.row]
        if getSameModel(model: model) {
            cell.setupViews(model: model, isSaved: true)
        } else {
            cell.setupViews(model: model, isSaved: false)
        }
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension NewsListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = newsArray[indexPath.row]
        newsListTableViewDelegate?.selectedCell(model: model)
    }
}
