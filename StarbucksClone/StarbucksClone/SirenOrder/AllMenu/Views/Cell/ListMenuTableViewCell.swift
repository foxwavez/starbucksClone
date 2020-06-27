//
//  ListMenuTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/21.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class ListMenuTableViewCell: UITableViewCell {
  
  static let identifier = "listMenuTVC"
  
  private let menuImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.layer.cornerRadius = 35
    $0.clipsToBounds = true
  }
  private let titleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
    $0.font = UIFont.boldSystemFont(ofSize: 14)
  }
  private let enTitleLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.6079670787, green: 0.5307973623, blue: 0.3349733949, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 11)
  }
  private let giftImage = UIButton().then {
    let edge: CGFloat = 3
    $0.setImage(UIImage(systemName: "gift"), for: .normal)
    $0.tintColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.4032030404, green: 0.3995964527, blue: 0.399479419, alpha: 1)
    $0.imageView?.contentMode = .scaleAspectFit
    $0.imageView?.clipsToBounds = true
    $0.imageEdgeInsets = UIEdgeInsets(top: edge, left: edge, bottom: edge, right: edge)
    $0.layer.cornerRadius = 9
  }
  private let priceLabel = UILabel().then {
    $0.textColor = .black
    $0.font = UIFont.systemFont(ofSize: 16)
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
    self.configure()
  }
  
  private func setupConstraints() {
    let margin: CGFloat = 10
    
    self.menuImageView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(margin * 1.5)
        $0.width.height.equalTo(70)
        $0.bottom.equalToSuperview().offset(-margin * 1.5).priority(700)
    }
    self.titleLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(menuImageView).offset(margin)
        $0.leading.equalTo(menuImageView.snp.trailing).offset(margin * 1.5)
    }
    self.giftImage.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(titleLabel)
        $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
        $0.width.height.equalTo(18)
    }
    self.enTitleLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(margin / 2)
        $0.leading.equalTo(titleLabel)
    }
    self.priceLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(enTitleLabel.snp.bottom).offset(margin / 2)
        $0.leading.equalTo(enTitleLabel)
    }
  }
  
  func configure() {
    self.titleLabel.text = "아메리카노"
    self.enTitleLabel.text = "Caffe Americano"
    self.priceLabel.text = "4,500원"
    self.menuImageView.image = UIImage(named: "coffee")
  }
}
