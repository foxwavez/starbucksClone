//
//  GSCatrItemTableViewCell.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/20.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSCatrItemTableViewCell: UITableViewCell {
  func configure(image: UIImage, title: String, price: String) {
    imgView.image = image
    titleLabel.text = title
    priceLabel.text = price
  }
  
  var check: Bool = true {
    didSet {
      if check {
        checkBox.image = UIImage(systemName: "checkmark")
      } else {
        checkBox.image = nil
      }
    }
  }
  
  static let id = "GSCatrItemTableViewCell"
  
  private let imgView = UIImageView().then {
    $0.layer.cornerRadius = 6
    $0.backgroundColor = .green
  }
  
  private let checkBox = UIImageView().then {
//    $0.image = UIImage(systemName: "checkmark")!
    $0.contentMode = .scaleAspectFit
    $0.backgroundColor = .yellow
    $0.layer.cornerRadius = 2
  }
  
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .bold)
    $0.textColor = .red
  }
  
  private let priceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
    $0.textColor = .blue
  }
  
  private let xButton = UIButton().then {
    $0.setImage(UIImage(systemName: "xmark"), for: .normal)
  }
 
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
    [imgView, checkBox, titleLabel, priceLabel, xButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    imgView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(32)
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(95)
      $0.bottom.equalToSuperview().offset(-32)
    }
    checkBox.snp.makeConstraints {
      $0.top.leading.equalTo(imgView).offset(4)
      $0.width.height.equalTo(20)
    }
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imgView.snp.trailing).offset(20)
      $0.top.equalToSuperview().offset(36)
    }
    priceLabel.snp.makeConstraints {
      $0.leading.equalTo(imgView.snp.trailing).offset(20)
      $0.top.equalTo(titleLabel.snp.bottom).offset(14)
    }
    xButton.snp.makeConstraints {
      $0.centerY.equalTo(imgView.snp.top)
      $0.trailing.equalToSuperview().offset(-12)
    }
  }
  
}
