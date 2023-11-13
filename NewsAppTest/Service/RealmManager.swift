//
//  RealmManager.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init(){}
    
    let realm = try! Realm()
    
    func saveNewsModel(model: NewsModel, isSelected: Bool) {
        try! realm.write {
            model.isSelected = isSelected
            realm.add(model)
        }
    }
    
    func deleteNewsModel(model: NewsModel, isSelected: Bool) {
        try! realm.write {
            model.isSelected = isSelected
            realm.delete(model)
        }
    }
    
    func getResultsNewsModel() -> Results<NewsModel> {
        realm.objects(NewsModel.self)
    }
}
