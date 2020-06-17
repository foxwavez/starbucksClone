//
//  GSHomeView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/21.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSHomeView: UIScrollView {
  private let bannerView: GSBannerView
  private let tagButtonView: GSTagButtonsView
  private let bestView: GSCollectionStyleView
  private let themeView: GSCollectionStyleView
  private let newView: GSCollectionStyleView
  
  init(_ banner: [UIImage], tags: [String], best: [[UIImage: String]], theme: [UIImage], new: [[UIImage: String]]) {
    bannerView = GSBannerView(banner)
    tagButtonView = GSTagButtonsView(tags)
    bestView = GSCollectionStyleView(items: best, title: "BEST", subtitle: "어제 가장 많이 선물한 메뉴")
    themeView = GSCollectionStyleView(items: theme, title: "테마 선물", subtitle: "")
    newView = GSCollectionStyleView(items: new, title: "NEW", subtitle: "새로 나온 선물")
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
    [bannerView, tagButtonView, bestView, themeView, newView].forEach { self.addSubview($0) }
  }
  
  private func setupConstraints() {
    [bannerView, tagButtonView, bestView, themeView, newView].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
        $0.width.equalToSuperview()
      }
    }
    bannerView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.height.equalTo(160)
    }
    tagButtonView.snp.makeConstraints {
      $0.top.equalTo(bannerView.snp.bottom)
      $0.height.equalTo(176)
    }
    bestView.snp.makeConstraints {
      $0.top.equalTo(tagButtonView.snp.bottom)
      $0.height.equalTo(252)
    }
    themeView.snp.makeConstraints {
      $0.top.equalTo(bestView.snp.bottom)
      $0.height.equalTo(408)
    }
    newView.snp.makeConstraints {
      $0.top.equalTo(themeView.snp.bottom)
      $0.height.equalTo(252)
      $0.bottom.equalToSuperview()
    }
  }
}
