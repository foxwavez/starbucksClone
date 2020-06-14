//
//  GSGiftListView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/09.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSGiftListView: UIView {
  
  private let dateView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9568627451, alpha: 1)
  }
  private let filterButton = UIButton().then {
    $0.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
    $0.imageView?.transform = .init(scaleX: -1, y: 1)
    $0.setTitle("  전체", for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.tintColor = .lightGray
    $0.setTitleColor(.lightGray, for: .normal)
  }
  private let dateButton = UIButton().then {
    $0.semanticContentAttribute = .forceRightToLeft
    $0.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    $0.tintColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    $0.setTitleColor(#colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 14)
  }
  private let noticeLabel = UILabel().then {
    $0.textColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    $0.font = .systemFont(ofSize: 13)
    $0.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
    $0.textAlignment = .center
    $0.numberOfLines = 0
  }

  init(text: String) {
    super.init(frame: .zero)
    noticeLabel.text = text
    setupUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
    dateFormatter()
  }
  
  private func setupAttributes() {
    [dateView, noticeLabel].forEach {
      self.addSubview($0)
    }
    [filterButton, dateButton].forEach {
      dateView.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    dateView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(44)
    }
    noticeLabel.snp.makeConstraints {
      $0.top.equalTo(dateView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    filterButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(16)
      $0.centerY.equalToSuperview()
    }
    dateButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-16)
      $0.centerY.equalToSuperview()
    }
  }
  
  private func dateFormatter() {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy.MM.dd"
    let currentDate = formatter.string(from: Date())
    
    let nowData = formatter.date(from: currentDate)
    let yearData = Date(timeIntervalSinceNow: 3.145e+7)
    let yearTimeinterval = nowData?.timeIntervalSince(yearData)
    let oneyearago = formatter.string(from: Date(timeInterval: yearTimeinterval!, since: nowData!))
    
    dateButton.setTitle("\(oneyearago) ~ \(currentDate) ", for: .normal)
  }
}
