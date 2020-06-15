//
//  SirenOrderMainViewController.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/15.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SirenOrderMainViewController: UIViewController {
  
  private var sirenOrderTableView = UITableView().then {
    $0.backgroundColor = #colorLiteral(red: 0.9161977768, green: 0.9009630084, blue: 0.8896496296, alpha: 1)
    $0.showsVerticalScrollIndicator = false
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
    view.backgroundColor = #colorLiteral(red: 0.9161977768, green: 0.9009630084, blue: 0.8896496296, alpha: 1)
    setupTableView()
  }
  
  private func setupConstraints() {
    let guide = view.safeAreaLayoutGuide
    let spacing: CGFloat = 10
    self.sirenOrderTableView.then { self.view.addSubview($0) }
      .snp.makeConstraints {
        $0.top.leading.trailing.equalTo(guide)
        $0.bottom.equalTo(guide).offset(-spacing)
    }
  }
  
  private func setupTableView() {
    self.sirenOrderTableView.delegate = self
    self.sirenOrderTableView.dataSource = self
    self.sirenOrderTableView.register(TopBannerTableViewCell.self, forCellReuseIdentifier: TopBannerTableViewCell.identifier)
  }
}

// MARK: - UITableViewDataSource
extension SirenOrderMainViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    3
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 1:
      return 80
    default:
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 1:
      return 3
    default:
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TopBannerTableViewCell.identifier, for: indexPath) as? TopBannerTableViewCell else { return UITableViewCell() }
      return cell
    default:
      return UITableViewCell()
    }
  }
}

// MARK: - UITableViewDelegate
extension SirenOrderMainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      return 155
    default:
      return 220
    }
  }
}
