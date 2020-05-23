//
//  GSSegmentControll.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/13.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSSegmentControll: UIView {

  private let menuViews = UIStackView().then {
    $0.axis = .horizontal
    $0.alignment = .center
    $0.distribution = .fillEqually
  }
  private let selectLine = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 0.337254902, alpha: 1)
  }
  private lazy var contentViews = UIScrollView().then {
    $0.backgroundColor = .gray
    $0.alwaysBounceHorizontal = true
    $0.delegate = self
  }

  init(_ contents: [[String: UIView]]) {
    super.init(frame: .zero)
    setupUI(contents)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI(_ contents: [[String: UIView]]) {
    self.backgroundColor = .white
    [menuViews, selectLine, contentViews].forEach { self.addSubview($0) }
    setupConstraints()
    
    contents.forEach {
      for (key, value) in $0 {
        makeButtonAndView(key, value)
      }
    }
    
    if let firstButton = menuViews.arrangedSubviews[0] as? UIButton {
      firstButton.isSelected = true
    }
  }
  
  private func setupConstraints() {
    menuViews.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(56)
    }
    selectLine.snp.makeConstraints {
      $0.width.equalTo(menuViews.snp.width).dividedBy(3)
      $0.bottom.equalTo(menuViews.snp.bottom)
      $0.leading.equalTo(menuViews.snp.leading)
      $0.height.equalTo(1)
    }
    contentViews.snp.makeConstraints {
      $0.top.equalTo(menuViews.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
      $0.width.equalTo(400)
//      $0.width.equalTo(UIScreen.main.bounds.width)
      $0.height.equalTo(UIScreen.main.bounds.height - 56)
    }
  }

  private func makeButtonAndView(_ title: String, _ addView: UIView) {
    UIButton().do {
      $0.setTitle(title, for: .normal)
      $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
      $0.setTitleColor(#colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 0.337254902, alpha: 1), for: .selected)
      $0.setTitleColor(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
      menuViews.addArrangedSubview($0)
    }
    addView.do {
      contentViews.addSubview($0)
      $0.snp.makeConstraints {
        $0.edges.size.equalToSuperview()
      }
    }
  }
  
//  private func makeMenuButton(_ title: String) -> UIButton {
//    return UIButton().then {
//      $0.setTitle(title, for: .normal)
//      $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
//      $0.setTitleColor(#colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 0.337254902, alpha: 1), for: .selected)
//      $0.setTitleColor(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
//    }
//  }
}

extension GSSegmentControll: UIScrollViewDelegate {
  
}
