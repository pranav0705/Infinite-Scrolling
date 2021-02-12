//
//  PriceBookItemViewModel.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

class PriceBookItemViewModel {
  var id: Int
  var name: String?
  var price: Double
  
  var imageUrl : String
  
  init(id: Int, name: String?, price: Double, imageUrl: String) {
    self.id = id
    self.name = name
    self.price = price
    self.imageUrl = imageUrl
  }
}
