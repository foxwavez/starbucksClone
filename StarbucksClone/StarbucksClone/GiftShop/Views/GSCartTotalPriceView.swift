//
//  GSCartTotalPriceView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/22.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSCartTotalPriceView: UIView {
  private let priceView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 2
  }
  private lazy var amountLabel = UILabel().then {
    $0.text = "총 \(totalAmount)개"
    $0.font = .systemFont(ofSize: 16, weight: .bold)
    $0.textColor = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
  }
  private lazy var priceLabel = UILabel().then {
    $0.text = "\(totalPrice)원"
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = #colorLiteral(red: 0.6745098039, green: 0.6, blue: 0.4117647059, alpha: 1)
  }
  private let payButton = UIButton().then {
    $0.setTitle("선물 결제하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    $0.backgroundColor = #colorLiteral(red: 0.3647058824, green: 0.3215686275, blue: 0.2980392157, alpha: 1)
    $0.layer.cornerRadius = 2
  }
  
  var totalAmount = 1
  var totalPrice = 14_000
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
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
    self.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2431372549, blue: 0.2156862745, alpha: 1)
    [priceView, payButton].forEach { self.addSubview($0) }
    [priceLabel, amountLabel].forEach { priceView.addSubview($0) }
  }
  
  private func setupConstraints() {
    priceView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.leading.equalToSuperview().offset(6)
      $0.trailing.equalToSuperview().offset(-6)
      $0.height.equalTo(60)
    }
    amountLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(16)
    }
    priceLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-16)
    }
    payButton.snp.makeConstraints {
      $0.top.equalTo(priceView.snp.bottom).offset(8)
      $0.leading.equalToSuperview().offset(6)
      $0.trailing.equalToSuperview().offset(-6)
      $0.bottom.equalToSuperview().offset(-42)
      $0.height.equalTo(44)
    }
  }
}
