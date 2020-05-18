//
//  GSBannerView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/18.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSBannerView: UIScrollView {
  private let bannerImages: [UIImage]
  
  private var timer: Timer?
  private var xOffSet: CGFloat = 0
  
  private lazy var bannerButton1 = UIButton().then {
    $0.setImage(bannerImages[0], for: .normal)
    $0.backgroundColor = .white
  }
  private lazy var bannerButton2 = UIButton().then {
    $0.setImage(bannerImages[1], for: .normal)
    $0.backgroundColor = .gray
  }
  private lazy var bannerButton3 = UIButton().then {
    $0.setImage(bannerImages[2], for: .normal)
    $0.backgroundColor = .black
  }
  
  init(_ images: [UIImage]) {
    bannerImages = images
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
    self.isPagingEnabled = true
    self.showsVerticalScrollIndicator = false
    self.showsHorizontalScrollIndicator = false
  }
  
  private func setupConstraints() {
    [bannerButton1,bannerButton2,bannerButton3].forEach{
      self.addSubview($0)
      $0.snp.makeConstraints {
        $0.top.bottom.equalToSuperview()
        $0.size.equalToSuperview()
      }
    }
    bannerButton1.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    bannerButton2.snp.makeConstraints {
      $0.leading.equalTo(bannerButton1.snp.trailing)
    }
    bannerButton3.snp.makeConstraints {
      $0.leading.equalTo(bannerButton2.snp.trailing)
      $0.trailing.equalToSuperview()
    }
  }
  
  private func autoScroll() {
    if timer == nil {
      let timer = Timer(timeInterval: 3.0,
                        target: self,
                        selector: #selector(timerAction),
                        userInfo: nil,
                        repeats: true)
      RunLoop.current.add(timer, forMode: .common)
      timer.tolerance = 0.1
      
      self.timer = timer
    }
  }
  
  @objc private func timerAction() {
    if xOffSet != self.frame.maxX*2 {
      xOffSet += bannerButton1.frame.maxX
      UIView.animate(withDuration: 1, delay: 0, animations: {
        self.contentOffset.x = self.xOffSet
      }, completion: nil)
    } else {
      UIView.animate(withDuration: 1, delay: 0, animations: {
        self.contentOffset.x = 0
      }, completion: nil)
      self.xOffSet = 0
    }
  }
}
