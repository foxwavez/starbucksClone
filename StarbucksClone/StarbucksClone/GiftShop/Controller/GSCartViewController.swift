//
//  GSCartViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/17.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSCartViewController: UIViewController {
  
  private let addButton = UIButton().then {
    $0.setImage(UIImage(systemName: "plus"), for: .normal)
    $0.imageEdgeInsets = UIEdgeInsets(top: 14, left: 0, bottom: 14, right: 10)
    $0.imageView?.contentMode = .center
    
    $0.tintColor = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
    $0.setTitle("선물 추가하기", for: .normal)
    $0.setTitleColor(#colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1), for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 12, weight: .bold)
    $0.layer.cornerRadius = 2
    $0.layer.borderWidth = 1
    $0.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
  }
  private let emptyLabel = UILabel().then {
    $0.text = "상단의 '선물 추가하기'\n버튼을 눌러 구매하고 싶은 선물을 추가해보세요!"
    $0.textAlignment = .center
    $0.textColor = #colorLiteral(red: 0.2666666667, green: 0.2666666667, blue: 0.2666666667, alpha: 1)
    $0.font = .systemFont(ofSize: 13)
    $0.numberOfLines = 0
  }
  private let noticeLabel = UILabel().then {
    $0.text = "담긴 선물은 2개월간 보관됩니다."
    $0.textAlignment = .center
    $0.textColor = #colorLiteral(red: 0.5176470588, green: 0.5176470588, blue: 0.5176470588, alpha: 1)
    $0.font = .systemFont(ofSize: 12)
  }
  private lazy var cartTableView = UITableView().then {
    $0.dataSource = self
    $0.register(GSCatrItemTableViewCell.self, forCellReuseIdentifier: GSCatrItemTableViewCell.id)
    $0.tableFooterView = UIView()
    $0.estimatedRowHeight = 90
    $0.rowHeight = UITableView.automaticDimension
  }
  private let totalView = GSCartTotalPriceView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupLayout()
  }
  
  private func setupAttributes() {
    self.title = "선물 장바구니"
    self.navigationItem.rightBarButtonItem =
      UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: nil)
    view.backgroundColor = .white
    [cartTableView, addButton, noticeLabel, totalView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupLayout() {
    cartTableView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
    }
    
    addButton.snp.makeConstraints {
      $0.top.equalTo(cartTableView.snp.bottom).offset(16)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.height.equalTo(40)
    }
    
    noticeLabel.snp.makeConstraints {
      $0.top.equalTo(addButton.snp.bottom).offset(32)
//      $0.bottom.equalToSuperview().offset(-32)
      $0.centerX.equalToSuperview()
    }
    
    totalView.snp.makeConstraints {
      $0.bottom.trailing.leading.equalToSuperview()
      $0.top.equalTo(noticeLabel.snp.bottom).offset(32)
//      $0.height.equalTo(164)
    }
  }
}

extension GSCartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let cart = GSCartModel.shared.cart else { return 0 }
    //    return cart.count
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: GSCatrItemTableViewCell.id, for: indexPath) as? GSCatrItemTableViewCell else { return UITableViewCell() }
    cell.configure(image: UIImage(named: "test")!, title: "테스트", price: "20000")
    return cell
  }
  
}
