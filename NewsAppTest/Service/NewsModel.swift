//
//  NewsModel.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import Foundation
import RealmSwift

class NewsModel: Object {
    @Persisted var title: String?
    @Persisted var author: String?
    @Persisted var date: String?
    @Persisted var image: String?
    @Persisted var descript: String?
    @Persisted var content: String?
    @Persisted var isFavorite: Bool = false
}
