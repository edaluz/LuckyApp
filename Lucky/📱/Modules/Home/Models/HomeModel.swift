//
//  HomeModel.swift
//  Lucky
//
//  Created by Emiliano Da luz on 08/10/2020.
//  Copyright © 2020 MEK. All rights reserved.
//

import  UIKit

struct HomeModel: Codable {
    var title: String
    var sections: [HomeSectionModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case sections
    }
}

struct HomeSectionModel: Codable {
    var title: String
    var promotions: [PromotionModel]
    
    enum CodingKeys: String, CodingKey {
        case title
        case promotions = "items"
    }
}

struct PromotionModel: Codable {
    var detailUrl: String
    var imageUrl: String
    var brand: String
    var title: String
    var tags: String?
    var favoriteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case detailUrl
        case imageUrl
        case brand
        case title
        case tags
        case favoriteCount
    }
}
