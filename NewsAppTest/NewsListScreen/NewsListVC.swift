//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 19.10.2023.
//

import UIKit

class NewsListVC: UIViewController {
    
    private let newsTable = NewsListTableView()
    
    override func viewWillAppear(_ animated: Bool) {
        newsTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        getNewsModels()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(newsTable)
        newsTable.newsListTableViewDelegate = self
    }
    
    private func getNewsModels() {
        NetworkDataFetch.shared.fetchNews { [weak self] data, error in
            guard let self = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            newsTable.getNews(models: data.results)
            newsTable.reloadData()
        }
    }
}

//MARK: NewsListTableViewProtocol

extension NewsListVC: NewsListTableViewProtocol {
    func selectedCell(model: NetworkModel) {
        let detailedVC = DetailedNewsScreenVC()
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

