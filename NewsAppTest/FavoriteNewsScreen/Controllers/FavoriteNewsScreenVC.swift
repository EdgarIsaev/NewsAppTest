//
//  FavoriteNewsScreenVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//


import UIKit

class FavoriteNewsScreenVC: UIViewController {

    private let favoriteTableView = FavoriteNewsTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
    }
    
    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(favoriteTableView)
        favoriteTableView.favoriteTableViewDelegate = self
    }
}

//MARK: FavoriteTableViewProtocol

extension FavoriteNewsScreenVC: FavoriteTableViewProtocol {
    func cellTapped() {
        let detailedNewsVC = DetailedNewsScreenVC()
        detailedNewsVC.modalPresentationStyle = .fullScreen
        present(detailedNewsVC, animated: true)
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
