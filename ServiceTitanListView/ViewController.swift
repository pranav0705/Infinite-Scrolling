//
//  ViewController.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import UIKit

class ViewController: UIViewController {

  let pageSize = 20
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let manager = ServiceManager()
    manager.fetchPricebookResponse(pageSize: pageSize) { [weak self] (priceBookResponse, error) in
      guard error == nil, let model = priceBookResponse else {
        return
      }
      let vm = PriceBookViewModel(page: model.page,
                                  pageSize: model.pageSize,
                                  totalCount: model.totalCount,
                                  hasMore: model.hasMore,
                                  priceBookItem: model.data)
      DispatchQueue.main.async {
        let vc = STListView(viewModel: vm, manager: manager)
        vc.modalPresentationStyle = .fullScreen
        self?.present(vc, animated: true, completion: nil)
      }
      
    }
    
  }


}

