//
//  STListView.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import UIKit

class STListView: UIViewController {
  
  private var viewModel: PriceBookViewModel
  
  var tableView = UITableView()
  private let manager: ServiceManager
  
  init(viewModel: PriceBookViewModel, manager: ServiceManager = ServiceManager()) {
    self.viewModel = viewModel
    self.manager = manager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addTableView()
  }
  
  func addTableView() {
    
    tableView.register(PricesTableViewCell.self, forCellReuseIdentifier: "cell")
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
  }
}

extension STListView: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.priceBookItem.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PricesTableViewCell else {
      return UITableViewCell()
    }
    cell.configure(imageUrl: viewModel.priceBookItem[indexPath.row].thumbnailUrlString,
                    title: viewModel.priceBookItem[indexPath.row].name,
                    price: viewModel.priceBookItem[indexPath.row].price)
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //viewModel.shouldFetchMore()
    if indexPath.row == viewModel.priceBookItem.count - 1 && viewModel.hasMore {
      makeCall()
    }
  }
  
  func makeCall() {
    manager.fetchPricebookResponse(pageSize: 20) { (model1, error) in
      guard error == nil, let model = model1 else {
        return
      }
      var data = self.viewModel.priceBookItem
      data.append(contentsOf: model.data)
      self.viewModel = PriceBookViewModel(page: model.page,
                                     pageSize: model.pageSize,
                                     totalCount: model.totalCount,
                                     hasMore: model.hasMore,
                                     priceBookItem: data)
      DispatchQueue.main.async {
        self.tableView.reloadData()
        self.view.layoutIfNeeded()
      }
      
    }
  }
}
