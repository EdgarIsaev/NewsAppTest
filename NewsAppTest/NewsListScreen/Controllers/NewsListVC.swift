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
        view.addSubview(newsTable)
    }

}

//MARK: SetConstraints

extension NewsListVC {
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            newsTable.topAnchor.constraint(equalTo: view.topAnchor),
            newsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

