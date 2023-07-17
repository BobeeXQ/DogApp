//
//  FetchDataModel.swift
//  DogApp
//
//  Created by 向前 on 7/15/23.
//

import Foundation
import Firebase

class FetchDataModel: ObservableObject {
    @Published var results = [ProductInfo]()
    @Published var category : Int = 0
    
    func getData(from keyword: String) {
        let db = Firestore.firestore()
        let query: Query
        let lowercaseKeyword = keyword.lowercased()
        
        switch category {
        case 0:
            query = db.collection("products").whereField("searchWords", arrayContains: lowercaseKeyword)
        default:
            query = db.collection("products").whereField("type", isEqualTo: category - 1).whereField("searchWords", arrayContains: lowercaseKeyword)
        }
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.results = snapshot.documents.compactMap { document in
                        guard let name = document["name"] as? String,
                              let type = document["type"] as? Int,
                              let ingredients = document["ingredients"] as? [String]
                        else {
                            return nil
                        }
                        
                        return ProductInfo(name: name, type: type, ingredients: ingredients)
                    }
                }
            }
        }
    }
}

class ProduceFetchDataModel: ObservableObject {
    @Published var results = [ProductInfo]()
    @Published var category : Int = 0
    
    func getData(from keyword: String) {
        let db = Firestore.firestore()
        let query: Query
        let lowercaseKeyword = keyword.lowercased()

        if keyword.isEmpty {
            query = db.collection("products").whereField("type", isEqualTo: 0)
        } else{
            query = db.collection("products").whereField("type", isEqualTo: 0).whereField("searchWords", arrayContains: lowercaseKeyword)
        }
        
        query.getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                DispatchQueue.main.async {
                    self.results = snapshot.documents.compactMap { document in
                        guard let name = document["name"] as? String,
                              let type = document["type"] as? Int,
                              let ingredients = document["ingredients"] as? [String]
                        else {
                            return nil
                        }
                        
                        return ProductInfo(name: name, type: type, ingredients: ingredients)
                    }
                }
            }
        }
    }
}
