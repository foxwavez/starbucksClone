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
  }
  private let getView = GSGiftListView(text:
  """
  선물 받은 e-Gift Item을
  우측 상단 + 버튼을 눌러 등록해보세요.

  등록하여 사용하시면,
  사이렌 오더로 즉시 사용이 가능하며,
  유효기간 만료 알림도 받으실 수 있어요.
  """
  )
  private let setView = GSGiftListView(text:
  """
  사이렌 오더 '선물하기'를 통해
  e-Gift Item을 선물해보세요.

  나만의 퍼스널 옵션을 더해 선물하실 수 있으며,
  스타벅스 카드로 결제하시면
  Free extra 혜택을 받으실 수 있어요.
  """
  )
  
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
    }
    getView.snp.makeConstraints {
      $0.top.leading.bottom.size.equalToSuperview()
    }
    setView.snp.makeConstraints {
      $0.leading.equalTo(getView.snp.trailing)
      $0.top.trailing.bottom.size.equalToSuperview()
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
