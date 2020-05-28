//
//  GiftShopViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/13.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GiftShopViewController: UIViewController {

  private let bannerData = [UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!]
  private let tagsData = ["감사", "홈카페", "생일", "응원", "사랑", "1-2만원대선물", "우정", "e-Gift Card"]
  private let bestData = [
    [UIImage(named: "test")!: "무엇이냐1"],
    [UIImage(named: "test")!: "무엇이냐2"],
    [UIImage(named: "test")!: "무엇이냐3"],
    [UIImage(named: "test")!: "무엇이냐4"],
    [UIImage(named: "test")!: "무엇이냐5"],
    [UIImage(named: "test")!: "무엇이냐6"],
    [UIImage(named: "test")!: "무엇이냐7"],
    [UIImage(named: "test")!: "무엇이냐8"],
    [UIImage(named: "test")!: "무엇이냐9"]
  ]
  private let themeData = [UIImage(named: "test")!, UIImage(named: "test")!, UIImage(named: "test")!]
  private let newData = [
    [UIImage(named: "test")!: "무엇이냐1"],
    [UIImage(named: "test")!: "무엇이냐2"],
    [UIImage(named: "test")!: "무엇이냐3"],
    [UIImage(named: "test")!: "무엇이냐4"],
    [UIImage(named: "test")!: "무엇이냐5"],
    [UIImage(named: "test")!: "무엇이냐6"],
    [UIImage(named: "test")!: "무엇이냐7"],
    [UIImage(named: "test")!: "무엇이냐8"],
    [UIImage(named: "test")!: "무엇이냐9"]
  ]
  
  private lazy var contentsView = GSSegmentControll([
    ["홈": GSHomeView(bannerData, tags: tagsData, best: bestData, theme: themeData, new: newData)],
    ["카테고리": GSHomeView(bannerData, tags: tagsData, best: bestData, theme: themeData, new: newData)],
    ["선물함": GSHomeView(bannerData, tags: tagsData, best: bestData, theme: themeData, new: newData)]
  ])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.backgroundColor = .white
    view.addSubview(contentsView)
    contentsView.snp.makeConstraints {
      $0.edges.size.equalToSuperview()
    }
  }
  
  private func setupConstraints() {
  }
}
