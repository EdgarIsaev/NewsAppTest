//
//  FavoriteNewsScreenVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//


import UIKit

class FavoriteNewsScreenVC: UIViewController {

    private let favoriteTableView = FavoriteNewsTableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getModels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(favoriteTableView)
        favoriteTableView.tableViewDelegate = self
        
    }
    
    private func getModels() {
        let allNews = RealmManager.shared.getResultsNewsModel()
        var newsList = [NewsModel]()
        for news in allNews {
            newsList.append(news)
        }
        favoriteTableView.getNews(model: newsList)
        favoriteTableView.reloadData()
    }
}

//MARK: FavoriteTableViewCellProtocol

extension FavoriteNewsScreenVC: FavoriteTableViewCellProtocol {
    func bookmarkButtonTapped(title: String) {
        let results = RealmManager.shared.getResultsNewsModel()
        for result in results {
            if result.title == title {
                RealmManager.shared.deleteNewsModel(model: result)
            }
        }
        getModels()
        favoriteTableView.reloadData()
    }
}

//MARK: FavoriteNewsTableViewProtocol

extension FavoriteNewsScreenVC: FavoriteNewsTableViewProtocol {
    func selectedCell(model: NewsModel) {
        let detailedVC = DetailedNewsScreenVC()
        detailedVC.setupFavoriteNews(model: model)
        detailedVC.modalPresentationStyle = .fullScreen
        present(detailedVC, animated: true)
    }
}

//MARK: SetConstraints

extension FavoriteNewsScreenVC {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            favoriteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
