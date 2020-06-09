//
//  GSGiftBoxView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/09.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSGiftBoxView: UIView {
  
  private let getButton = UIButton().then {
    $0.isSelected = true
    $0.setTitle("받은 선물", for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.setTitleColor(.white, for: .selected)
    $0.setTitleColor(#colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1), for: .normal)
    $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    $0.layer.borderWidth = 1
    $0.layer.borderColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.layer.cornerRadius = 4
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  private let setBuuton = UIButton().then {
    $0.setTitle("보낸 선물", for: .normal)
    $0.backgroundColor = .white
    $0.setTitleColor(.white, for: .selected)
    $0.setTitleColor(#colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1), for: .normal)
    $0.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    $0.layer.borderWidth = 1
    $0.layer.borderColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
    $0.layer.cornerRadius = 4
    $0.titleLabel?.font = .systemFont(ofSize: 12)
    $0.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  private lazy var boxScrollView = UIScrollView().then {
    $0.isScrollEnabled = false
    $0.delegate = self
  }
  private let getView = GSGetBoxView()
  private let setView = GSSetBoxView()
  
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
    self.backgroundColor = .white
    [getButton, setBuuton, boxScrollView].forEach {
      self.addSubview($0)
    }
    [getView, setView].forEach { boxScrollView.addSubview($0) }
  }
  
  private func setupConstraints() {
    getButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalToSuperview().multipliedBy(0.06)
      $0.trailing.equalTo(self.snp.centerX)
    }
    setBuuton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(12)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalToSuperview().multipliedBy(0.06)
      $0.leading.equalTo(self.snp.centerX)
    }
    boxScrollView.snp.makeConstraints {
      $0.top.equalTo(getButton.snp.bottom).offset(12)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.width.equalTo(self.snp.width)
//      $0.height.equalTo(self.bounds.height - 12 - 12 - getButton.bounds.height)
    }
    getView.snp.makeConstraints {
      $0.edges.size.equalToSuperview()
    }
    setView.snp.makeConstraints {
      $0.edges.size.equalToSuperview()
    }
  }
  @objc private func didTapButton(_ button: UIButton) {
    if button == getButton {
      getButton.isSelected = true
      getButton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
      setBuuton.isSelected = false
      setBuuton.backgroundColor = .white
      UIView.animate(withDuration: 0.3) {
        self.boxScrollView.contentOffset.x = 0
      }
    } else {
      getButton.isSelected = false
      getButton.backgroundColor = .white
      setBuuton.isSelected = true
      setBuuton.backgroundColor = #colorLiteral(red: 0.5529411765, green: 0.5098039216, blue: 0.4745098039, alpha: 1)
      UIView.animate(withDuration: 0.3) {
        self.boxScrollView.contentOffset.x = self.boxScrollView.frame.width
      }
    }
  }
}

extension GSGiftBoxView: UIScrollViewDelegate {
  
}
