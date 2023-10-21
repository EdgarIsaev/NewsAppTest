//
//  NewsListTableViewCell.swift
//  NewsApp
//
//  Created by Эдгар Исаев on 20.10.2023.
//

import Foundation
import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .red
        selectionStyle = .none
        
    }
}
