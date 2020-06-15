//
//  MenuImageButton.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class MenuImageButton: UIButton {
  
  // MARK: Views
  private let menuImageView = UIImageView().then {
    $0.image = UIImage(named: "coffee")
    $0.layer.cornerRadius = 45
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  private let viewfinderImage = UIButton(type: .custom).then {
    let image = UIImage(named: "focus")?.withRenderingMode(.alwaysTemplate)
    let edge: CGFloat = 6
    $0.setImage(image, for: .normal)
    $0.layer.cornerRadius = 13
    $0.tintColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.1842891872, green: 0.1843279302, blue: 0.1842867434, alpha: 1)
    $0.imageEdgeInsets = UIEdgeInsets(top: edge, left: edge-3, bottom: 8, right: edge-3)
    $0.imageView?.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.isEnabled = false
  }
  
  // MARK: Initialize
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupConstraints()
  }
  
  private func setupConstraints() {
    let imageSize: CGFloat = 90
    let viewFinderSize: CGFloat = 26
    
    self.menuImageView.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalToSuperview()
        $0.width.height.equalTo(imageSize)
    }
    self.viewfinderImage.then { self.addSubview($0) }
      .snp.makeConstraints {
        $0.width.height.equalTo(viewFinderSize)
        $0.trailing.bottom.equalToSuperview()
    }
  }
}
