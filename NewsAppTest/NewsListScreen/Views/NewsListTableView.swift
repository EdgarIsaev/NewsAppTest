//
//  NewsListTableView.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import UIKit

protocol TableViewProtocol: AnyObject {
    func cellTapped()
}

class NewsListTableView: UITableView {
    
    weak var tableViewDelegate: TableViewProtocol?
    
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
        backgroundColor = .white
        separatorStyle = .none
        
        dataSource = self
        delegate = self
    }
    
    @objc private func cellTapped() {
        tableViewDelegate?.cellTapped()
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
        
        let tapCell = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        tapCell.cancelsTouchesInView = true
        cell.contentView.addGestureRecognizer(tapCell)
        
        return cell
    }
    
    
}

// MARK: UITableViewDelegate

extension NewsListTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
}
