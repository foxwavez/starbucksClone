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
    $0.isPagingEnabled = true
    $0.showsHorizontalScrollIndicator = false
    $0.delegate = self
  }
  
  init(_ contents: [[String: UIView]]) {
    super.init(frame: .zero)
    setupUI(contents)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    contentViews.snp.makeConstraints {
      $0.height.equalTo(self.bounds.height - 56)
    }
  }
  
  private func setupUI(_ contents: [[String: UIView]]) {
    self.backgroundColor = .white
    [menuViews, selectLine, contentViews].forEach { self.addSubview($0) }
    setupConstraints()
    makeButtonAndView(contents)
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
      $0.height.equalTo(2)
    }
    contentViews.snp.makeConstraints {
      $0.top.equalTo(menuViews.snp.bottom)
      $0.leading.equalTo(menuViews.snp.leading)
      $0.trailing.bottom.equalToSuperview()
      $0.width.equalToSuperview()
    }
  }
  
  private func makeButtonAndView(_ contents:[[String: UIView]]) {
    for idx in 0..<contents.count {
      for (title, addView) in contents[idx] {
        UIButton().do { button in
          button.setTitle(title, for: .normal)
          button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
          button.setTitleColor(#colorLiteral(red: 0.6117647059, green: 0.5333333333, blue: 0.337254902, alpha: 1), for: .selected)
          button.setTitleColor(#colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
          button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
          menuViews.addArrangedSubview(button)
        }
        addView.do { v in
          contentViews.addSubview(v)
        }
        addView.snp.makeConstraints { v in
          v.top.bottom.size.equalToSuperview()
          switch addView {
          case contents[0].values.first:
            v.leading.equalToSuperview()
          case contents[contents.count-1].values.first:
            v.trailing.equalToSuperview()
            fallthrough
          default:
            v.leading.equalTo(contents[idx-1].values.first!.snp.trailing)
          }
        }
      }
    }
  }
  
  @objc private func didTapButton(_ sender: UIButton) {
    guard let idx = menuViews.subviews.firstIndex(of: sender) else { return }
    UIView.animate(withDuration: 0.3) {
      self.selectLine.snp.updateConstraints {
        $0.leading.equalTo(self.menuViews.snp.leading).offset(sender.bounds.width * CGFloat(idx))
      }
      self.contentViews.contentOffset.x = self.contentViews.bounds.width * CGFloat(idx)
      self.layoutIfNeeded()
    }
  }
}

extension GSSegmentControll: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    UIView.animate(withDuration: 0.3) {
      self.selectLine.snp.updateConstraints {
        $0.leading.equalTo(self.menuViews.snp.leading).offset(
          scrollView.contentOffset.x/CGFloat(self.menuViews.subviews.count)
        )
      }
      self.layoutIfNeeded()
    }
  }
}
