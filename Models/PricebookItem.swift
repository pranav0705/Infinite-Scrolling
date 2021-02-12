//
//  PricebookItem.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

struct PricebookItem: Codable {
    var id: Int
    var name: String?
    var price: Double
    
    var thumbnailUrlString : String {
        return "https://picsum.photos/id/\(id % 1000)/75/75"
    }
}
