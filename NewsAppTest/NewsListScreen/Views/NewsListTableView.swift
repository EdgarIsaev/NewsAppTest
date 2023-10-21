//
//  NewsListTableView.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import Foundation
import UIKit

class NewsListTableView: UITableView {
    
    private let idTableViewCell = "idTableViewCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        register(NewsListTableViewCell.self, forCellReuseIdentifier: idTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .blue
        
        dataSource = self
        delegate = self
    }
}

// MARK: UITableViewDataSource

extension NewsListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: idTableViewCell, for: indexPath) as? NewsListTableViewCell
        else { return UITableViewCell() }
        
        return cell
    }
    
    
}

// MARK: UITableViewDelegate

extension NewsListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
