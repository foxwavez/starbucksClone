//
//  GiftShopViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/13.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GiftShopViewController: UIViewController {
  
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
  }
  
  private func setupConstraints() {
    let testImage = UIImage(named: "test")!
    let test: [[UIImage: String]] = [
      [UIImage(named: "test") ?? testImage: "테스트 중간으로 모여라~"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"],
      [UIImage(named: "test") ?? testImage: "테스트"]
    ]
    let bestView = GSCollectionStyleView(items: test, title: "BEST", subtitle: "가장 베스트트트ㅡ트트르르")
    bestView.backgroundColor = .white
    view.addSubview(bestView)
    bestView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(20)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(250)
    }
  }
}
