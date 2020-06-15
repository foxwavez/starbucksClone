//
//  SeventhBasketTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SeventhBasketTableViewCell: UITableViewCell {
  
  // MARK: Property
  static let identifier = "BasketButton"
  
  // MARK: Views
  private let addBasketButton = UIButton().then {
   $0.setTitle("장바구니 담기", for: .normal)
   $0.setTitleColor(#colorLiteral(red: 0.4782953858, green: 0.432043016, blue: 0.3970021009, alpha: 1), for: .normal)
   $0.backgroundColor = #colorLiteral(red: 0.8427177072, green: 0.8242866993, blue: 0.7939980626, alpha: 1)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14.5)
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
    // targetAction
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    
    self.addBasketButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing / 2)
        $0.leading.trailing.equalToSuperview().inset(spacing)
        $0.bottom.equalToSuperview().offset(-spacing * 2)
    }
  }
}
