//
//  MenuSectionHeaderView.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/15.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class MenuSectionHeaderView: UIView {
  // MARK: Views
  
  private let backView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 4
  }
  private let leftLineView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.7060133815, green: 0.7061738372, blue: 0.7022020221, alpha: 1)
  }
  private let rightLineView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.7060133815, green: 0.7061738372, blue: 0.7022020221, alpha: 1)
  }
  private let bottomLineView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.9161977768, green: 0.9009630084, blue: 0.8896496296, alpha: 1)
  }
  private let allMenuButton = MenuButton(image: "allMenu", title: "전체 메뉴")
  private let myMenuButton = MenuButton(image: "myMenu", title: "나만의 메뉴")
  private let historyButton = MenuButton(image: "history", title: "히스토리")
  
  
  // MARK: Initialize
  
  override init(frame: CGRect) {
    super.init(frame: frame)
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
    [allMenuButton, myMenuButton, historyButton].forEach {
      $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }
  }
  
  private func setupConstraints() {
    let viewWidth = UIScreen.main.bounds.width
    let spacing: CGFloat = 16
    let lineHeight: CGFloat = 32
    let lineSpacing = ((viewWidth - spacing) / 3) - 4
    
    self.backView.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.bottom.trailing.equalToSuperview().inset(spacing / 2)
    }
    self.leftLineView.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing)
        $0.leading.equalToSuperview().offset(lineSpacing)
        $0.height.equalTo(lineHeight)
        $0.width.equalTo(2)
    }
    self.myMenuButton.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing)
        $0.centerX.equalToSuperview()
    }
    self.rightLineView.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing)
        $0.trailing.equalToSuperview().offset(-lineSpacing)
        $0.height.equalTo(lineHeight)
        $0.width.equalTo(2)
    }
    self.allMenuButton.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing)
        $0.trailing.equalTo(leftLineView).offset(-spacing)
    }
    self.historyButton.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(allMenuButton)
        $0.leading.equalTo(rightLineView).offset(spacing)
    }
    self.bottomLineView.then { backView.addSubview($0) }
      .snp.makeConstraints {
        $0.leading.bottom.width.equalToSuperview()
        $0.height.equalTo(1)
    }
  }
  
  // MARK: Action
  @objc func didTapButton(_ sender: UIButton) {
    switch sender {
    case allMenuButton:
      print("전체 메뉴")
    case myMenuButton:
      print("나만의 메뉴")
    case historyButton:
      print("히스토리")
    default:
      break
    }
  }
}
