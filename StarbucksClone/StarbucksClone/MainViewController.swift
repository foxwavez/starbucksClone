//
//  ViewController.swift
//  StarbucksClone
//
//  Created by JinGyung Kim on 2020/05/07.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit
import Then
import Alamofire
import Kingfisher
import SnapKit

class MainViewController: UIViewController {
  
  private let welcomeLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    $0.textColor = .white
    $0.text = "안녕하세요. 스타벅스입니다."
    $0.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.1137254902, blue: 0.1137254902, alpha: 1)
    $0.textAlignment = .center
  }
  
  private let rewardsButton = UIButton().then {
    $0.setTitle("사막여우", for: .normal)
  }
  
  private let cardButton = UIButton().then {
    $0.setTitle("Card", for: .normal)
  }
  
  private let sirenOrderButton = UIButton().then {
    $0.setTitle("Siren Order", for: .normal)
  }
  
  private let giftShopButton = UIButton().then {
    $0.setTitle("Gift Shop", for: .normal)
  }
  
  private let eCouponButton = UIButton().then {
    $0.setTitle("e-Coupon", for: .normal)
  }
  
  private let whatsNewButton = UIButton().then {
    $0.setTitle("What's New", for: .normal)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
    setupLayout()
  }
  
  private func setupUI() {
    view.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    [welcomeLabel, rewardsButton, cardButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setupNavigation() {
    let logoImage: String = "logo_starbucks"
    self.navigationItem.titleView = UIImageView(image: UIImage(named: logoImage))
    self.navigationItem.titleView?.contentMode = .scaleAspectFit
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "line.horizontal.3"), style: .done, target: self, action: #selector(didTapLeftBarButton(sender:)))
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(systemName: "bell"), style: .done, target: self, action: #selector(didTapRightBarbutton(sender:)))
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: nil)
  }
  
  private func setupLayout(){
    let guide = view.safeAreaLayoutGuide
    welcomeLabel.snp.makeConstraints {
      $0.top.equalTo(guide)
      $0.width.equalTo(guide)
      $0.height.equalTo(guide).multipliedBy(0.05)
      $0.centerX.equalTo(guide)
    }
    rewardsButton.snp.makeConstraints {
      $0.top.equalTo(welcomeLabel.snp.bottom).offset(100)
      $0.leading.equalTo(guide).offset(100)
      $0.trailing.equalTo(cardButton.snp.leading)
    }
    cardButton.snp.makeConstraints {
      $0.top.equalTo(welcomeLabel).offset(100)
      $0.leading.equalTo(rewardsButton).offset(100)
      $0.trailing.equalTo(guide)
    }
  }
  
  @objc private func didTapLeftBarButton(sender: UIBarButtonItem) {
    self.navigationController?.pushViewController(MenuViewController(), animated: true)
  }
  @objc private func didTapRightBarbutton(sender: UIBarButtonItem) {
    self.navigationController?.pushViewController(NotificationViewController(), animated: true)
  }
}


