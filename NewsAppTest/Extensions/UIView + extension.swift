//
//  UIView + extension.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import UIKit

extension UIView {
    
    func viewGrowingEffect(_ sender: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, animations: {
                sender.transform = CGAffineTransform.identity
            })
        })
    }
}
