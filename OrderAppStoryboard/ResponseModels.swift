//
//  ResponseModels.swift
//  OrderAppStoryboard
//
//  Created by H.Namikawa on 2023/05/16.
//

import Foundation

struct MenuResponse : Codable {
  let items: [MenuItem]
}

struct CategoriesResponse: Codable {
  let categories: [String]
}

struct OrderResponse: Codable {
  let prepTime : Int
  
  enum CodingKeys: String, CodingKey {
    case prepTime = "preparation_time"
  }
}
