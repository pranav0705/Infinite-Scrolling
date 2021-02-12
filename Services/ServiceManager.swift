//
//  ServiceManager.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import Foundation

protocol ServiceManagerProtocols {
  func fetchPricebookResponse(pageSize: Int,
                              completion: @escaping (_ priceBookResponse: PricebookResponse?,_ error: Error? ) -> Void)
}

class ServiceManager {
  let manager: Services
  
  init() {
    self.manager = Services()
  }
}

extension ServiceManager: ServiceManagerProtocols{
  func fetchPricebookResponse(pageSize: Int, completion: @escaping (_ priceBookResponse: PricebookResponse?,_ error: Error? ) -> Void) {
    manager.fetchPricebookResponse(pageSize: pageSize, completion: { (priceBookModel, error) in
      completion(priceBookModel, error)
    })
  }
}
