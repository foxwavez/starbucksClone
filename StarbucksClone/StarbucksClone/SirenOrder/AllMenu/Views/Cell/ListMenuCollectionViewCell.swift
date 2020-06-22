//
//  ListMenuCollectionViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/21.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class ListMenuCollectionViewCell: UICollectionViewCell {
  
  // MARK: Property
  static let identifier = "listMenuCVC"
  
  // MARK: Views
  private var listMenuTableView = UITableView()
  
  // MARK: Initialize
  override init(frame: CGRect) {
    super .init(frame: frame)
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
    setupTableView()
  }
  
  private func setupTableView() {
    self.listMenuTableView.delegate = self
    self.listMenuTableView.dataSource = self
    self.listMenuTableView.register(ListMenuTableViewCell.self, forCellReuseIdentifier: ListMenuTableViewCell.identifier)
  }
  
  private func setupConstraints() {
    self.listMenuTableView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}

extension ListMenuCollectionViewCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 15
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = listMenuTableView.dequeueReusableCell(withIdentifier: ListMenuTableViewCell.identifier, for: indexPath) as? ListMenuTableViewCell else { return UITableViewCell() }
    return cell
  }
}

extension ListMenuCollectionViewCell: UITableViewDelegate {
}
