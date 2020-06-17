//
//  MenuButton.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/15.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
  
   // MARK: Views

   private let buttonImageView = UIImageView().then {
     $0.contentMode = .scaleAspectFit
   }
   private let buttonTitleLabel = UILabel().then {
     $0.textColor = .black // 색상바꾸기
     $0.font = UIFont.systemFont(ofSize: 14)
   }
   
   // MARK: Initialize
   
   override init(frame: CGRect) {
      super.init(frame: frame)
    }
    
    convenience init(image: String, title: String) {
      self.init()
      self.buttonImageView.image = UIImage(named: image)
      self.buttonTitleLabel.text = title
      setupConstraints()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
   
   private func setupConstraints() {
     let spacing: CGFloat = 4
     let imageSize: CGFloat = 34
     
     self.buttonImageView.then { self.addSubview($0) }
       .snp.makeConstraints {
         $0.top.leading.equalToSuperview()
         $0.width.height.equalTo(imageSize)
         $0.bottom.equalToSuperview().priority(999)
     }
     self.buttonTitleLabel.then { self.addSubview($0) }
       .snp.makeConstraints {
         $0.leading.equalTo(buttonImageView.snp.trailing).offset(spacing)
         $0.centerY.equalTo(buttonImageView)
         $0.trailing.equalToSuperview()
     }
   }
}
