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
    self.detailTableView.register(FifthOptionsTableViewCell.self, forCellReuseIdentifier: FifthOptionsTableViewCell.identifier)
    self.detailTableView.register(SixthOrderTableViewCell.self, forCellReuseIdentifier: SixthOrderTableViewCell.identifier)
    self.detailTableView.register(SeventhBasketTableViewCell.self, forCellReuseIdentifier: SeventhBasketTableViewCell.identifier)
    self.detailTableView.register(SirenOrderMenuTableViewCell.self, forCellReuseIdentifier: SirenOrderMenuTableViewCell.identifier)
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
      cell.delegate = self
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
    case 4:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: FifthOptionsTableViewCell.identifier, for: indexPath) as? FifthOptionsTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 5:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SixthOrderTableViewCell.identifier, for: indexPath) as? SixthOrderTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 6:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SeventhBasketTableViewCell.identifier, for: indexPath) as? SeventhBasketTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = .white
      return cell
    case 7:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: SirenOrderMenuTableViewCell.identifier, for: indexPath) as? SirenOrderMenuTableViewCell else { return UITableViewCell() }
      cell.selectionStyle = .none
      cell.backgroundColor = #colorLiteral(red: 0.9161977768, green: 0.9009630084, blue: 0.8896496296, alpha: 1)
      cell.sectionTitleLabel.text = "비슷한 다른 메뉴"
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
    case 3, 4:
      return viewWidth / 4.5
    case 5:
      return viewWidth / 7.5
    case 6:
      return viewWidth / 6
    case 7:
      return viewWidth / 1.8
    default:
      return 0
    }
  }
}

// MARK:- FirstBasicInformProtocol
extension MenuDetailViewController: FirstBasicInformProtocol {
  func popUpDetailView() {
    let imageDetailVC = ImageDetailViewController()
    imageDetailVC.modalPresentationStyle = .overCurrentContext
    self.present(imageDetailVC, animated: false)
  }
}
