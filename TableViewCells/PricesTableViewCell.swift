//
//  PricesTableViewCell.swift
//  ServiceTitanListView
//
//  Created by Pranav Bhandari on 11/13/20.
//

import UIKit

class PricesTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  var priceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  var priceImageView: UIImageView = {
    let iv = UIImageView()
    iv.translatesAutoresizingMaskIntoConstraints = false
    return iv
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    addImageView()
    addTitleLabel()
    addPriceLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func stringToImage(_ handler: @escaping ((UIImage?)->())) {

         }
  
  func configure(imageUrl: String, title: String?, price: Double) {
    
    let formatter = NumberFormatter()
    formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
    formatter.numberStyle = .currency
    if let formattedTipAmount = formatter.string(from: price as NSNumber) {
      priceLabel.text = formattedTipAmount
    }
    
    titleLabel.text = title ?? ""
//    priceLabel.text = String(format: "Tip Amount: $%.02f", tipAmount)
    
    
    
    //imageView.download(imageUrl)
    if let url = URL(string: imageUrl) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
              DispatchQueue.main.async {
                self.priceImageView.image = image
              }
            }
        }.resume()
    }
  }
  
  func addImageView() {
    contentView.addSubview(priceImageView)
    
    priceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
    priceImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    priceImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    priceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
  }
  
  func addTitleLabel() {
    contentView.addSubview(titleLabel)
    
    titleLabel.leadingAnchor.constraint(equalTo: priceImageView.trailingAnchor, constant: 8).isActive = true
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
  }
  
  func addPriceLabel() {
    contentView.addSubview(priceLabel)
    
    priceLabel.leadingAnchor.constraint(equalTo: priceImageView.trailingAnchor, constant: 8).isActive = true
    priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
    priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
//    priceLabel.lead
  }
  
  override func prepareForReuse() {
    priceImageView.image = UIImage()
    titleLabel.text = ""
    priceLabel.text = ""
  }
}
