//
//  Services.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

//
//let ST_API_KEY: String = "45b2c77d-332c-4aec-8595-a2a47b7e9356"
//var currentPage = 1
//var pageSize = 20
//var pricebookApiUrlString = "https://api.servicetitan.com/v1/services?filter.page=\(currentPage)&filter.pageSize=\(pageSize)&serviceTitanApiKey=\(ST_API_KEY)"
//
//struct PricebookResponse {
//    var page: Int
//    var pageSize: Int
//    var totalCount: Int
//    var hasMore: Bool
//    var data: [PricebookItem]
//}
//
//struct PricebookItem {
//    var id: Int
//    var name: String?
//    var price: Double
//
//    var thumbnailUrlString : String {
//        return "https://picsum.photos/id/\(id % 1000)/75/75"
//    }
//}

class Services {
  
  let ST_API_KEY: String = "45b2c77d-332c-4aec-8595-a2a47b7e9356"
  var currentPage = 1
  
  func fetchPricebookResponse(pageSize: Int,
                              completion: @escaping (_ priceBookResponse: PricebookResponse?,_ error: Error? ) -> Void) {
    let pricebookApiUrlString: String = "https://api.servicetitan.com/v1/services?filter.page=\(currentPage)&filter.pageSize=\(pageSize)&serviceTitanApiKey=\(ST_API_KEY)"
    guard let url = URL(string: pricebookApiUrlString) else {
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let session = URLSession.shared
    let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//        print(response!)
      guard error == nil, let data = data else {
        //TODO: logging or alert message
        return
      }
        do {
          let json = try JSONDecoder().decode(PricebookResponse.self, from: data)
          completion(json, nil)
        } catch {
          print("error while fetching - \(error.localizedDescription)")
          completion(nil, error)
        }
    })
    task.resume()
    currentPage += 1
  }
}
