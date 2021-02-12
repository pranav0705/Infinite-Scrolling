//
//  PricebookResponse.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

struct PricebookResponse: Codable {
    var page: Int
    var pageSize: Int
    var totalCount: Int
    var hasMore: Bool
    var data: [PricebookItem]
}
