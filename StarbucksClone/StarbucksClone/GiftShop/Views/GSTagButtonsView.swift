//
//  GSTagButtonsView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/18.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSTagButtonsView: UIView {
  private let topStackView = UIStackView().then {
    $0.axis = .horizontal
    $0.alignment = .center
    $0.distribution = .fillEqually
  }
  private let bottomStackView = UIStackView().then {
    $0.axis = .horizontal
    $0.alignment = .center
    $0.distribution = .fillEqually
  }
  
  private let tags: [String]
  
  init(_ tags: [String]) {
    self.tags = tags
    super.init(frame: .zero)
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
    [topStackView, bottomStackView].forEach { self.addSubview($0) }
    
    for (idx, txt) in tags.enumerated() {
      UIButton().do {
//        $0.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
//        $0.imageView?.contentMode = .scaleAspectFit
        $0.setTitle(txt, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.tag = idx
        $0.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        if idx < 4 {
          topStackView.addArrangedSubview($0)
        } else {
          bottomStackView.addArrangedSubview($0)
        }
      }
    }
  }
  
  private func setupConstraints() {
    topStackView.snp.makeConstraints {
      $0.top.leading.trailing.width.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.5)
    }
    bottomStackView.snp.makeConstraints {
      $0.bottom.leading.trailing.width.equalToSuperview()
      $0.top.equalTo(topStackView.snp.bottom)
      $0.height.equalToSuperview().multipliedBy(0.5)
    }
  }
  
  @objc private func didTabButton(_ sender: UIButton) {
    print(sender.tag)
  }
}
