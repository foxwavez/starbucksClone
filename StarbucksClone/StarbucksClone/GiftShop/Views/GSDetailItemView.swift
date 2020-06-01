//
//  GSDetailItemView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/29.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSDetailItemView: UIView {

  private var count = 1 {
      didSet {
        countLabel.text = "\(count)"
        itemPriceLabel.text = "\(price * count) 원"
    }
  }
  
  private let price: Int

  private let itemImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
  }
  private let itemTitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
  }
  private let itemSubtitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 14, weight: .medium)
  }
  private let itemPriceLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .bold)
    $0.textColor = #colorLiteral(red: 0.6618039012, green: 0.5844079852, blue: 0.391377151, alpha: 1)
  }
  private let minusButton = UIButton().then {
    $0.setImage(UIImage(systemName: "minus"), for: .normal)
    $0.imageView?.isHighlighted = true
    $0.layer.cornerRadius = 2
    $0.tintColor = #colorLiteral(red: 0.4504895806, green: 0.4027304351, blue: 0.3770147562, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.829349339, green: 0.8158304095, blue: 0.7850875258, alpha: 1)
  }
  private let plusButton = UIButton().then {
    $0.setImage(UIImage(systemName: "plus"), for: .normal)
    $0.imageView?.isHighlighted = true
    $0.layer.cornerRadius = 2
    $0.tintColor = #colorLiteral(red: 0.4504895806, green: 0.4027304351, blue: 0.3770147562, alpha: 1)
    $0.backgroundColor = #colorLiteral(red: 0.829349339, green: 0.8158304095, blue: 0.7850875258, alpha: 1)
  }
  private let countLabel = UILabel().then {
    $0.text = "1"
    $0.textAlignment = .center
    $0.font = .systemFont(ofSize: 16, weight: .bold)
  }
  private let addButton = UIButton().then {
    $0.setTitle("담기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    $0.setTitleColor(#colorLiteral(red: 0.5289751887, green: 0.4811838269, blue: 0.45547086, alpha: 1), for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.8411129713, green: 0.8275960088, blue: 0.7968521714, alpha: 1)
    $0.layer.cornerRadius = 2
  }
  private let presentButton = UIButton().then {
    $0.setTitle("선물하기", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
    $0.setTitleColor(#colorLiteral(red: 0.9606098533, green: 0.9609289765, blue: 0.956355989, alpha: 1), for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.4786907434, green: 0.4260859191, blue: 0.4004599154, alpha: 1)
    $0.layer.cornerRadius = 2
  }
  
  init(item: GiftDetailItem) {
    price = item.price
    super.init(frame: .zero)
    setupUI()
    itemImageView.image = UIImage(named: item.title)
    itemTitleLabel.text = item.title
    itemSubtitleLabel.text = item.subtitle
    itemPriceLabel.text = "\(item.price) 원"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    self.backgroundColor = .white
    [minusButton, plusButton, addButton, presentButton].forEach({
        $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    })
    [itemImageView, itemTitleLabel, itemSubtitleLabel, itemPriceLabel, countLabel, minusButton, plusButton, addButton, presentButton].forEach {
      self.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    itemImageView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.64)
    }
    itemTitleLabel.snp.makeConstraints {
      $0.top.equalTo(itemImageView.snp.bottom)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.96)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
    itemSubtitleLabel.snp.makeConstraints {
      $0.top.equalTo(itemTitleLabel.snp.bottom)
      $0.leading.trailing.equalTo(itemTitleLabel)
      $0.height.equalToSuperview().multipliedBy(0.02)
    }
    itemPriceLabel.snp.makeConstraints {
      $0.top.equalTo(itemSubtitleLabel.snp.bottom).offset(24)
      $0.leading.equalTo(itemSubtitleLabel.snp.leading)
      $0.width.equalToSuperview().multipliedBy(0.6)
    }
    minusButton.snp.makeConstraints {
      $0.leading.equalTo(itemPriceLabel.snp.trailing)
      $0.centerY.equalTo(itemPriceLabel)
      $0.width.equalToSuperview().multipliedBy(0.09)
      $0.height.equalTo(minusButton.snp.width)
    }
    countLabel.snp.makeConstraints {
      $0.leading.equalTo(minusButton.snp.trailing)
      $0.top.bottom.equalTo(minusButton)
      $0.trailing.equalTo(plusButton.snp.leading)
    }
    plusButton.snp.makeConstraints {
      $0.top.bottom.equalTo(minusButton)
      $0.width.equalTo(minusButton.snp.height)
      $0.trailing.equalTo(itemTitleLabel)
    }
    addButton.snp.makeConstraints {
      $0.leading.equalTo(itemTitleLabel)
      $0.width.equalToSuperview().multipliedBy(0.44)
      $0.bottom.equalToSuperview().offset(-16)
      $0.height.equalToSuperview().multipliedBy(0.08)
    }
    presentButton.snp.makeConstraints {
      $0.trailing.equalTo(itemTitleLabel)
      $0.width.equalToSuperview().multipliedBy(0.44)
      $0.bottom.equalToSuperview().offset(-16)
      $0.height.equalToSuperview().multipliedBy(0.08)
    }
  }
  
  @objc private func didTapButton(_ button: UIButton) {
          switch button.currentImage {
          case UIImage(systemName: "minus"):
              if count > 1 {
                  count -= 1
              }
          case UIImage(systemName: "plus"):
              count += 1
          default:
              break
          }
      }
}
