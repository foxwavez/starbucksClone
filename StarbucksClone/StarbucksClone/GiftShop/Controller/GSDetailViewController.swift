//
//  GSDetailViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/29.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSDetailViewController: UIViewController {
  
  private let contentsScrollView = UIScrollView()
  private let itemDetailView: GSDetailItemView
  private let otherItemsView: GSCollectionStyleView
  
  init(seletedItem: GiftDetailItem, otherItems: [Any]) {
    self.itemDetailView = GSDetailItemView(item: seletedItem)
    self.otherItemsView = GSCollectionStyleView(items: otherItems, title: "이런 선물은 어떠세요?", subtitle: "")
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  override func viewWillLayoutSubviews() {
    let guide = view.safeAreaLayoutGuide
    itemDetailView.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
    itemDetailView.heightAnchor.constraint(equalTo: guide.heightAnchor, multiplier: 0.88).isActive = true
    
    otherItemsView.widthAnchor.constraint(equalTo: guide.widthAnchor).isActive = true
    otherItemsView.heightAnchor.constraint(equalTo: otherItemsView.widthAnchor, multiplier: 0.72).isActive = true
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9098039216, alpha: 1)
    view.addSubview(contentsScrollView)
    [itemDetailView, otherItemsView].forEach { contentsScrollView.addSubview($0) }
  }
  
  private func setupConstraints() {
    contentsScrollView.snp.makeConstraints {
      $0.edges.size.equalToSuperview()
    }
    
    itemDetailView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    
    otherItemsView.snp.makeConstraints {
      $0.top.equalTo(itemDetailView.snp.bottom).offset(12)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}
