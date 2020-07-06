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
  
  private let userName = "사막여우"
  private let userLavel = "Welcome level"
  
  private let rewardsButton = UIButton().then {
//    $0.setTitle("사막여우", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    $0.contentVerticalAlignment = .bottom
    $0.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 40.0, right: 0.0)
  }
  
  private let rewardsImg = UIImageView().then {
    $0.image = UIImage(named: "rewardIscon")
    $0.contentMode = .scaleAspectFit
  }
  
  private let rewardCount = UILabel().then {
    $0.textColor = .white
    $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
  }
  
  private let lineHorizental = UIView().then {
    $0.backgroundColor = UIColor(white: 1, alpha: 0.1)
  }
  
  private let cardButton = UIButton().then {
    $0.setTitle("Card", for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    $0.contentVerticalAlignment = .center
    $0.titleEdgeInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
  }
  
  private let cardImg = UIImageView().then {
    $0.image = UIImage(named: "cardIcon")
    $0.contentMode = .scaleAspectFit
  }
  
  private let cardMoney = UILabel().then {
    $0.text = "23,900원"
    $0.textColor = .white
    $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
  }
  
  private let cardName = UILabel().then {
    $0.text = "포션카드"
    $0.textColor = .white
    $0.font = UIFont.systemFont(ofSize: 14, weight: .medium)
  }
  
  private let lineVertical = UIView().then {
     $0.backgroundColor = UIColor(white: 1, alpha: 0.1)
   }
  
  private let sirenOrderButton = UIButton().then {
    $0.setTitle("Siren Order", for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    $0.contentVerticalAlignment = .center
    $0.titleEdgeInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
  }
  
  private let sirenOrderImg = UIImageView().then {
    $0.image = UIImage(named: "sirenIcon")
    $0.contentMode = .scaleAspectFit
  }
  
  private let lineHorizental2 = UIView().then {
    $0.backgroundColor = UIColor(white: 1, alpha: 0.1)
  }
  
  private let giftShopButton = UIButton().then {
    $0.setTitle("Gift Shop", for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    $0.contentVerticalAlignment = .bottom
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    $0.contentVerticalAlignment = .center
    $0.titleEdgeInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 0.0)
  }
  
  private let giftShopImg = UIImageView().then {
    $0.image = UIImage(named: "giftIcon")
    $0.contentMode = .scaleAspectFit
  }
  
  private let lineVertical2 = UIView().then {
    $0.backgroundColor = UIColor(white: 1, alpha: 0.1)
  }
  
  private let eCouponButton = UIButton().then {
    $0.setTitle("e-Coupon", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
  }
  
  private let lineHorizental3 = UIView().then {
     $0.backgroundColor = UIColor(white: 1, alpha: 0.1)
   }
  
  private let whatsNewButton = UIButton().then {
    $0.setTitle("What's New", for: .normal)
    $0.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    $0.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupNavigation()
    setupLayout()
  }
  
  private func setupUI() {
    view.backgroundColor = #colorLiteral(red: 0.06274509804, green: 0.06274509804, blue: 0.06274509804, alpha: 1)
    rewardsButton.setTitle("\(userName)", for: .normal)
    [welcomeLabel, rewardsButton, rewardsImg, cardButton, cardImg, cardMoney, cardName, sirenOrderButton, sirenOrderImg, giftShopButton, giftShopImg, eCouponButton, whatsNewButton, lineVertical, lineHorizental, lineHorizental2, lineVertical2, lineHorizental3].forEach {
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
      $0.top.centerX.width.equalTo(guide)
      $0.height.equalTo(guide).multipliedBy(0.05)
    }
    rewardsButton.snp.makeConstraints {
      $0.top.equalTo(welcomeLabel.snp.bottom)
      $0.leading.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(2)
      $0.height.equalTo(guide).dividedBy(2.5)
      $0.trailing.equalTo(cardButton.snp.leading)
    }
    rewardsImg.snp.makeConstraints {
      $0.centerX.equalTo(rewardsButton)
      $0.centerY.equalTo(rewardsButton)
      $0.width.equalTo(rewardsButton).dividedBy(1.2)
      $0.height.equalTo(rewardsButton).dividedBy(1.4)
    }
    lineHorizental.snp.makeConstraints {
      $0.centerX.equalTo(guide)
      $0.centerY.equalTo(rewardsButton)
      $0.width.equalTo(rewardsButton).dividedBy(100)
      $0.height.equalTo(rewardsButton).dividedBy(1.2)
    }
    cardButton.snp.makeConstraints {
      $0.top.equalTo(welcomeLabel.snp.bottom)
      $0.leading.equalTo(rewardsButton.snp.trailing).offset(100)
      $0.width.equalTo(guide).dividedBy(2)
      $0.height.equalTo(guide).dividedBy(2.5)
      $0.trailing.equalTo(guide)
    }
    cardImg.snp.makeConstraints {
      $0.centerX.equalTo(cardButton).offset(-4)
      $0.centerY.equalTo(cardButton).offset(-16)
      $0.width.equalTo(cardButton).dividedBy(1.14)
      $0.height.equalTo(cardButton).dividedBy(1.3)
    }
    cardMoney.snp.makeConstraints {
      $0.centerX.equalTo(cardButton)
      $0.centerY.equalTo(cardButton).offset(76)
    }
    cardName.snp.makeConstraints {
      $0.centerX.equalTo(cardButton)
      $0.centerY.equalTo(cardButton).offset(100)
    }
    lineVertical.snp.makeConstraints {
      $0.top.equalTo(sirenOrderButton.snp.top)
      $0.centerX.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(1.1)
      $0.height.equalTo(sirenOrderButton).dividedBy(120)
    }
    sirenOrderButton.snp.makeConstraints {
      $0.top.equalTo(rewardsButton.snp.bottom)
      $0.leading.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(2)
      $0.height.equalTo(guide).dividedBy(3)
      $0.trailing.equalTo(giftShopButton.snp.leading)
    }
    sirenOrderImg.snp.makeConstraints {
      $0.centerX.equalTo(sirenOrderButton)
      $0.centerY.equalTo(sirenOrderButton).offset(-12)
      $0.width.equalTo(sirenOrderButton).dividedBy(1.14)
      $0.height.equalTo(sirenOrderButton).dividedBy(1.3)
    }
    lineHorizental2.snp.makeConstraints {
      $0.centerX.equalTo(guide)
      $0.centerY.equalTo(sirenOrderButton)
      $0.width.equalTo(sirenOrderButton).dividedBy(100)
      $0.height.equalTo(sirenOrderButton).dividedBy(1.2)
    }
    giftShopButton.snp.makeConstraints {
      $0.top.equalTo(cardButton.snp.bottom)
      $0.leading.equalTo(sirenOrderButton.snp.trailing)
      $0.trailing.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(2)
      $0.height.equalTo(guide).dividedBy(3)
    }
    giftShopImg.snp.makeConstraints {
      $0.centerX.equalTo(giftShopButton)
      $0.centerY.equalTo(giftShopButton).offset(-12)
      $0.width.equalTo(giftShopButton).dividedBy(1.14)
      $0.height.equalTo(giftShopButton).dividedBy(1.3)
    }
    lineVertical2.snp.makeConstraints {
      $0.top.equalTo(eCouponButton.snp.top)
      $0.centerX.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(1.1)
      $0.height.equalTo(sirenOrderButton).dividedBy(120)
    }
    eCouponButton.snp.makeConstraints {
      $0.top.equalTo(sirenOrderButton.snp.bottom)
      $0.leading.equalTo(guide)
      $0.trailing.equalTo(whatsNewButton.snp.leading)
      $0.width.equalTo(guide).dividedBy(2)
      $0.bottom.equalTo(guide)
    }
    lineHorizental3.snp.makeConstraints {
      $0.centerX.equalTo(guide)
      $0.centerY.equalTo(eCouponButton)
      $0.width.equalTo(eCouponButton).dividedBy(100)
      $0.height.equalTo(eCouponButton).dividedBy(1.2)
    }
    whatsNewButton.snp.makeConstraints {
      $0.top.equalTo(giftShopButton.snp.bottom)
      $0.leading.equalTo(eCouponButton.snp.trailing)
      $0.trailing.equalTo(guide)
      $0.width.equalTo(guide).dividedBy(2)
      $0.bottom.equalTo(guide)
    }
  }
  
  @objc private func didTapLeftBarButton(sender: UIBarButtonItem) {
    self.navigationController?.pushViewController(MenuViewController(), animated: true)
  }
  @objc private func didTapRightBarbutton(sender: UIBarButtonItem) {
    self.navigationController?.pushViewController(NotificationViewController(), animated: true)
  }
}


