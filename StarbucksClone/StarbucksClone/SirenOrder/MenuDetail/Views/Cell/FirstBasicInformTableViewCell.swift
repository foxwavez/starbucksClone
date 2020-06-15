//
//  FirstBasicInformTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

protocol FirstBasicInformProtocol: class {
  func popUpDetailView()
}

class FirstBasicInformTableViewCell: UITableViewCell {
  
  // MARK: Property
  weak var delegate: FirstBasicInformProtocol?
  
  // MARK: Property
  static let identifier = "BasicInformTVC"
  let numberFormatter = NumberFormatter()
  var quantity = 1
  let price = 4500
  var totalPrice: Int!
  
  // MARK: Views
  private var menuImage = MenuImageButton()
  //  private var menuImage = UIImageView().then {
  //    $0.image = UIImage(named: "SirenOrderCoffee")
  //    $0.layer.cornerRadius = 45
  //    $0.contentMode = .scaleAspectFit
  //    $0.clipsToBounds = true
  //  }
  private var nameLabel = UILabel().then {
    $0.text = "카페 아메리카노"
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 14)
  }
  private var EnNameLabel = UILabel().then {
    $0.text = "Cafe Americano"
    $0.textColor = #colorLiteral(red: 0.5706792474, green: 0.4998695254, blue: 0.2411729693, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 11)
  }
  private let giftImage = UIButton().then {
    let edge:CGFloat = 3
    $0.setImage(UIImage(systemName: "gift"), for: .normal)
    $0.tintColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.4055633843, green: 0.3873202801, blue: 0.3783214092, alpha: 1)
    $0.imageView?.contentMode = .scaleAspectFit
    $0.imageView?.clipsToBounds = true
    $0.imageEdgeInsets = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
    $0.layer.cornerRadius = 8
  }
  private let bookMarkButton = UIButton().then {
    $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.2402512133, green: 0.2282746434, blue: 0.2135821283, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.8831503391, green: 0.8801552653, blue: 0.8799651265, alpha: 1)
    let edge2:CGFloat = 8
    $0.imageView?.contentMode = .scaleAspectFit
    $0.imageView?.clipsToBounds = true
    $0.imageEdgeInsets = UIEdgeInsets(top: edge2, left: edge2, bottom: edge2, right: edge2)
    $0.layer.cornerRadius = 15
  }
  private var priceLabel = UILabel().then {
    $0.text = "4,500원"
    //$0.text = "\(numberFormatter.string(from: NSNumber(value: 4500))!)원"
    $0.textColor = #colorLiteral(red: 0.2402512133, green: 0.2282746434, blue: 0.2135821283, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 20)
  }
  private let minusButton = UIButton().then {
    $0.setImage(UIImage(systemName: "minus"), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.4818699956, green: 0.4320361614, blue: 0.3969430029, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.8459115028, green: 0.8242676258, blue: 0.7976967096, alpha: 1)
    $0.layer.cornerRadius = 2
  }
  private var quantityLabel = UILabel().then {
    $0.text = "1"
    //$0.text = "\(quantity)"
    $0.textColor = #colorLiteral(red: 0.2402512133, green: 0.2282746434, blue: 0.2135821283, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 20)
  }
  private let plusButton = UIButton().then {
    $0.setImage(UIImage(systemName: "plus"), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.4818699956, green: 0.4320361614, blue: 0.3969430029, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.8459115028, green: 0.8242676258, blue: 0.7976967096, alpha: 1)
    $0.layer.cornerRadius = 2
  }
  
  // MARK: Initialize
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    self.menuImage.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.plusButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    self.minusButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    
    self.menuImage.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing * 2)
        $0.leading.equalToSuperview().offset(spacing)
        $0.width.height.equalTo(90)
    }
    self.nameLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(menuImage)
        $0.leading.equalTo(menuImage.snp.trailing).offset(spacing * 1.5)
    }
    self.giftImage.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(nameLabel)
        $0.leading.equalTo(nameLabel.snp.trailing).offset(3)
        $0.width.height.equalTo(17)
    }
    self.bookMarkButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(giftImage)
        $0.trailing.equalToSuperview().offset(-spacing)
        $0.width.height.equalTo(30)
    }
    self.EnNameLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(nameLabel.snp.bottom).offset(3)
        $0.leading.equalTo(nameLabel)
    }
    self.priceLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(EnNameLabel.snp.bottom).offset(spacing * 1.5)
        $0.leading.equalTo(EnNameLabel)
    }
    self.minusButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(priceLabel.snp.bottom).offset(spacing * 1.5)
        $0.leading.equalTo(priceLabel)
        $0.width.height.equalTo(30)
        $0.bottom.equalToSuperview().offset(-spacing)
    }
    self.quantityLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.equalTo(minusButton.snp.trailing).offset(spacing * 3)
        $0.centerY.equalTo(minusButton)
    }
    self.plusButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.equalTo(quantityLabel.snp.trailing).offset(spacing * 3)
        $0.width.height.equalTo(30)
        $0.bottom.equalToSuperview().offset(-spacing)
    }
  }
  
  // MARK: Action
  @objc func didTapButton(_ sender: UIButton) {
    switch sender {
    case menuImage:
      delegate?.popUpDetailView()
    case plusButton:
      if quantity < 20 {
        quantity += 1
      }
      quantityLabel.text = "\(quantity)"
      numberFormatter.numberStyle = .decimal
      totalPrice = quantity * price
      priceLabel.text = "\(numberFormatter.string(from: NSNumber(value: totalPrice))!)원"
    case minusButton:
      if quantity > 1 {
        quantity -= 1
      }
      quantityLabel.text = "\(quantity)"
      numberFormatter.numberStyle = .decimal
      totalPrice = quantity * price
      priceLabel.text = "\(numberFormatter.string(from: NSNumber(value: totalPrice))!)원"
    default:
      break
    }
  }
}
