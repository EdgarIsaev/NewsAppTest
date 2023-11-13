//
//  FavoriteNewsScreenVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//


import UIKit

class FavoriteNewsScreenVC: UIViewController {

    private let favoriteTableView = UITableView()
    
    private let idFavoriteTableViewCell = "idFavoriteTableViewCell"
    
    private var newsArray = [NewsModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getModels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
        setDelegates()
        favoriteTableView.register(FavoriteNewsTableViewCell.self, forCellReuseIdentifier: idFavoriteTableViewCell)
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        favoriteTableView.translatesAutoresizingMaskIntoConstraints = false
        favoriteTableView.backgroundColor = .white
        favoriteTableView.separatorStyle = .none
        
        view.addSubview(favoriteTableView)
    }
    
    private func setDelegates() {
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
    }
    
    private func getModels() {
        let allNews = RealmManager.shared.getResultsNewsModel()
        newsArray = [NewsModel]()
        for news in allNews {
            newsArray.append(news)
        }
        favoriteTableView.reloadData()
    }
}

//MARK: UITableViewDataSource

extension FavoriteNewsScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idFavoriteTableViewCell, for: indexPath) as? FavoriteNewsTableViewCell
        else { return UITableViewCell() }
        
        let model = newsArray[indexPath.row]
        cell.setupViews(model: model)
        
        return cell
    }
}

//MARK: UITableViewDelegate

extension FavoriteNewsScreenVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailedVC = DetailedNewsScreenVC()
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
