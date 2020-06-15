//
//  FifthOptionsTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

protocol FifthOptionButtonProtocol: class {
  func chooseSize()
}

class FifthOptionsTableViewCell: UITableViewCell {
  
  // MARK: Property
  weak var delegate: FifthOptionButtonProtocol?
  static let identifier = "OptionButtons"
  
  // MARK: Views
  var sizeOptionButton = ChooseSizeCustomButton()
  private let personalOptionButton = PersonalOptionCustomButton()
  
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
    self.sizeOptionButton.addTarget(self, action: #selector(didTapSizeButton(_:)), for: .touchUpInside)
    self.personalOptionButton.addTarget(self, action: #selector(didTapPersonalOptionButton(_:)), for: .touchUpInside)
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    
    self.sizeOptionButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.bottom.equalTo(self.contentView.snp.centerY).offset(-spacing / 2)
        $0.leading.trailing.equalToSuperview().inset(spacing)
    }
    self.personalOptionButton.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(self.contentView.snp.centerY).offset(spacing / 2)
        $0.leading.trailing.height.equalTo(sizeOptionButton)
    }
  }
  
  // MARK: Action
  @objc func didTapSizeButton(_ sender: UIButton) {
    delegate?.chooseSize()
    print("사이즈버튼클릭")
  }
  @objc func didTapPersonalOptionButton(_ sender: UIButton) {
    print("퍼스널옵션버튼클릭")
  }
}
// MARK:- MenuDetailProtocol
extension FifthOptionsTableViewCell: MenuDetailProtocol {
  func sendBackSizeData(data: String) {
    self.sizeOptionButton.sizeLabel.text = data
  }
}
