//
//  NewsListVC.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 19.10.2023.
//

import UIKit

class NewsListVC: UIViewController {
    
    private let newsTable = NewsListTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setConstraints()
    }

    private func addSubviews() {
        view.backgroundColor = .white
        
        view.addSubview(newsTable)
        newsTable.tableViewDelegate = self
    }

}

//MARK: TableViewProtocol

extension NewsListVC: TableViewProtocol {
    func cellTapped() {
        let detailedNewsVC = DetailedNewsScreenVC()
        detailedNewsVC.modalPresentationStyle = .fullScreen
        present(detailedNewsVC, animated: true)
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

