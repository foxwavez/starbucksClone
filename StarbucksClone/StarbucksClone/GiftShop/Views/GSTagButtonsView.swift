//
//  GSTagButtonsView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/18.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSTagButtonsView: UIView {
  // stackView 쓸 걸 ..
  private let tags: [String]
  private var tagButtons: [UIButton] = []
  
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
    for (idx, txt) in tags.enumerated() {
      UIButton().do {
//        $0.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
//        $0.imageView?.contentMode = .scaleAspectFit
        $0.setTitle(txt, for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.tag = idx
        $0.addTarget(self, action: #selector(didTabButton(_:)), for: .touchUpInside)
        tagButtons.append($0)
        self.addSubview($0)
      }
    }
  }
  
  private func setupConstraints() {
    for (idx, btn) in tagButtons.enumerated() {
      if idx < 4 {
        btn.snp.makeConstraints { $0.top.equalToSuperview() }
      } else {
        btn.snp.makeConstraints { $0.bottom.equalToSuperview() }
      }
      
      switch idx {
      case 0, 4:
        btn.snp.makeConstraints { $0.leading.equalToSuperview() }
      case 3, 7:
        btn.snp.makeConstraints { $0.trailing.equalToSuperview() }
      default:
        btn.snp.makeConstraints { $0.leading.equalTo(tagButtons[idx-1].snp.trailing) }
      }
    }
  }
  
  @objc private func didTabButton(_ sender: UIButton) {
    print(sender.tag)
  }
}
