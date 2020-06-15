//
//  MenuDetailViewController.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class MenuDetailViewController: UIViewController {
  
  // MARK: Views
  private let detailTableView = UITableView().then {
    $0.separatorStyle = .none
  }
  
  // MARK: Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  // MARK: Initialize
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    self.view.backgroundColor = .white
    setupNavigationBar()
    setupTableView()
  }
  private func setupNavigationBar() {
    title = "메뉴 상세"
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
    navigationController?.navigationBar.tintColor = .white
    let orderListButton = UIButton().then {
      $0.setImage(UIImage(systemName: "bag"), for: .normal)
      $0.imageView?.contentMode = .scaleToFill
      $0.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
    }
    navigationItem.rightBarButtonItem = UIBarButtonItem(customView: orderListButton)
  }
  
  private func setupTableView() {
    self.detailTableView.delegate = self
    self.detailTableView.dataSource = self
    self.detailTableView.register(FirstBasicInformTableViewCell.self, forCellReuseIdentifier: FirstBasicInformTableViewCell.identifier)
    self.detailTableView.register(SecondTemperatureTableViewCell.self, forCellReuseIdentifier: SecondTemperatureTableViewCell.identifier)
    self.detailTableView.register(ThirdCupMessageTableViewCell.self, forCellReuseIdentifier: ThirdCupMessageTableViewCell.identifier)
    self.detailTableView.register(FourthChooseCupTableViewCell.self, forCellReuseIdentifier: FourthChooseCupTableViewCell.identifier)
  }
  
  private func setupConstraints() {
    let guide = view.safeAreaLayoutGuide
    
    self.detailTableView.then { view.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.bottom.equalTo(guide)
    }
  }
}

// MARK:- UITableViewDataSource

extension MenuDetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    8
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstBasicInformTableViewCell.identifier, for: indexPath) as? FirstBasicInformTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondTemperatureTableViewCell.identifier, for: indexPath) as? SecondTemperatureTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdCupMessageTableViewCell.identifier, for: indexPath) as? ThirdCupMessageTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 3:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: FourthChooseCupTableViewCell.identifier, for: indexPath) as? FourthChooseCupTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    default:
      return UITableViewCell()
    }
  }
}

// MARK:- UITableViewDelegate

extension MenuDetailViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let viewWidth = UIScreen.main.bounds.width
    switch indexPath.row {
    case 0:
      return viewWidth / 2.5
    case 1:
      return viewWidth / 6
    case 2:
      return viewWidth / 6
    case 3:
      return viewWidth / 4.5
    default:
      return 0
    }
  }
}
