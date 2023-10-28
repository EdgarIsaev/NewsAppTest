//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 19.10.2023.
//

import UIKit

class NewsListVC: UIViewController {
    
    private let newsTable: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var newsArray = [NetworkModel]()
    
    private let idTableViewCell = "idTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        getNewsModels()
        setDelegate()
        newsTable.register(NewsListTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(newsTable)
    }
    
    private func getNewsModels() {
        NetworkDataFetch.shared.fetchNews { [weak self] data, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            self.newsArray.append(contentsOf: data.results)
            self.newsTable.reloadData()
        }
    }
    
    private func setDelegate() {
        newsTable.dataSource = self
        newsTable.delegate = self
    }
}

//MARK: UITableViewDataSource

extension NewsListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = newsTable.dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? NewsListTableViewCell
        else { return UITableViewCell() }
        
        let model = newsArray[indexPath.row]
        cell.setupViews(model: model)
        cell.setRealmModel(model: model)
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension NewsListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = DetailedNewsScreenVC()
        let model = newsArray[indexPath.row]
        detailedVC.setupViews(model: model)
        detailedVC.modalPresentationStyle = .fullScreen
        present(detailedVC, animated: true)
    }
}

//MARK: SetConstraints

extension NewsListVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            newsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

