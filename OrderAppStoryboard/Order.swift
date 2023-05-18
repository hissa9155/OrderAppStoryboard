//
//  Order.swift
//  OrderAppStoryboard
//
//  Created by H.Namikawa on 2023/05/16.
//

import Foundation

struct Order : Codable {
  var menuItems : [MenuItem]
  
  init(menuItems: [MenuItem] = []) {
    self.menuItems = menuItems
  }
}
