//
//  ThirdCupMessageTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class ThirdCupMessageTableViewCell: UITableViewCell {
  // MARK: Property
  static let identifier = "CupMessage"
  
  // MARK: Views
  let msgLabel = UILabel().then {
    $0.text = "디카페인 커피 Tab에서 \n 디카페인, 1/2디카페인 카페 아메리카노를 주문할 수 있습니다."
    $0.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 13)
    $0.numberOfLines = 2
    $0.textAlignment = .center
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
    setupConstraints()
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    self.msgLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing / 2)
        $0.leading.trailing.bottom.equalToSuperview().inset(spacing)
    }
  }
}
