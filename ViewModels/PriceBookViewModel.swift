//
//  PriceBookViewModel.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

class PriceBookViewModel {
  var page: Int
  var pageSize: Int
  var totalCount: Int
  var hasMore: Bool
  var priceBookItem: [PricebookItem]
  
  init(page: Int, pageSize: Int, totalCount: Int, hasMore: Bool, priceBookItem: [PricebookItem]) {
    self.page = page
    self.pageSize = pageSize
    self.totalCount = totalCount
    self.hasMore = hasMore
    self.priceBookItem = priceBookItem
  }
}
