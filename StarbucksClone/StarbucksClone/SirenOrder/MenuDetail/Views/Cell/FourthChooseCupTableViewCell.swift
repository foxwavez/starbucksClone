//
//  FourthChooseCupTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class FourthChooseCupTableViewCell: UITableViewCell {
  // MARK: Property
  static let identifier = "ChooseCup"
  
  // MARK: Views
  private let chooseCupLabel = UILabel().then {
    $0.text = "컵 선택"
    $0.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 13)
  }
  private let cupMsgLabel = UILabel().then {
    $0.text = "   환경보호를 위해 매장 내에서는 머그컵을 사용해주세요.  "
    $0.textColor = .white
    $0.font = UIFont.systemFont(ofSize: 12)
    $0.backgroundColor = #colorLiteral(red: 0.2100584805, green: 0.6369680166, blue: 0.5805844665, alpha: 1)
    $0.layer.borderColor = #colorLiteral(red: 0.2100584805, green: 0.6369680166, blue: 0.5805844665, alpha: 1)
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 10
    $0.clipsToBounds = true
  }
  private let buttonView = UIView().then {
    $0.backgroundColor = .clear
    $0.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    $0.layer.borderWidth = 1
    $0.layer.cornerRadius = 2
  }
  private let lineView1 = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
  }
  private let lineView2 = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
  }
  private let mugCupButton = UIButton().then {
    $0.setTitle("매장컵", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
  }
  private let personalCupButton = UIButton().then {
    $0.setTitle("개인컵", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
  }
  private let plasticCupButton = UIButton().then {
    $0.setTitle("일회용컵", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1), for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 12)
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
    self.mugCupButton.addTarget(self, action: #selector(didTapStoreCup(_:)), for: .touchUpInside)
    self.personalCupButton.addTarget(self, action: #selector(didTapPersonalCup(_:)), for: .touchUpInside)
    self.plasticCupButton.addTarget(self, action: #selector(didTapPlasticCup(_:)), for: .touchUpInside)
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 10
    let cellWidth = (UIScreen.main.bounds.width) - (spacing * 2)
    
    self.chooseCupLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.equalToSuperview().offset(spacing)
    }
    self.cupMsgLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.bottom.equalTo(chooseCupLabel)
        $0.trailing.equalToSuperview().offset(-spacing)
        $0.height.equalTo(20)
    }
    self.buttonView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(chooseCupLabel.snp.bottom).offset(spacing)
        $0.leading.trailing.bottom.equalToSuperview().inset(spacing)
        $0.height.equalTo(cellWidth / 10)
    }
    self.lineView1.then { self.buttonView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.bottom.equalTo(buttonView)
        $0.leading.equalTo(buttonView).offset(cellWidth / 3)
        $0.width.equalTo(1)
    }
    self.lineView2.then { self.buttonView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.bottom.equalTo(buttonView)
        $0.leading.equalTo(buttonView.snp.trailing).offset(-cellWidth / 3)
        $0.width.equalTo(1)
    }
    self.mugCupButton.then { self.buttonView.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.top.height.equalTo(buttonView)
        $0.width.equalTo(cellWidth / 3)
    }
    self.personalCupButton.then { self.buttonView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.height.equalTo(buttonView)
        $0.leading.equalTo(mugCupButton.snp.trailing)
        $0.width.equalTo(cellWidth / 3)
    }
    self.plasticCupButton.then { self.buttonView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.trailing.height.equalTo(buttonView)
        $0.width.equalTo(cellWidth / 3)
    }
  }
  
  // MARK: Actions
  @objc func didTapPlasticCup(_ sender: Any) {
    plasticCupButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    plasticCupButton.setTitleColor(.white, for: .normal)
    cupMsgLabel.text = "  ✓컵 선택이 완료되었습니다.  "
    [personalCupButton, mugCupButton].forEach {
      $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      $0.backgroundColor = .clear
    }
  }
  
  @objc func didTapPersonalCup(_ sender: Any) {
    personalCupButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    personalCupButton.setTitleColor(.white, for: .normal)
    cupMsgLabel.text = "  ☘️환경보호에 동참해주셔서 감사합니다.  "
    [plasticCupButton, mugCupButton].forEach {
      $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      $0.backgroundColor = .clear
    }
  }
  
  @objc func didTapStoreCup(_ sender: Any) {
    mugCupButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    mugCupButton.setTitleColor(.white, for: .normal)
    cupMsgLabel.text = "  ☘️환경보호에 동참해주셔서 감사합니다.  "
    [personalCupButton, plasticCupButton].forEach {
      $0.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
      $0.backgroundColor = .clear
    }
  }
}
