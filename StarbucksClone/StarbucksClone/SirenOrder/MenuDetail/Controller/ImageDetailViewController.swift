//
//  ImageDetailViewController.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
  
  // MARK: Views
  private let backView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  private let menuImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  private let dismissButton = UIButton().then {
    $0.setImage(UIImage(systemName: "multiply"), for: .normal)
    $0.tintColor = .black
    //let edge2:CGFloat = 8
    $0.imageView?.contentMode = .scaleAspectFit
    $0.imageView?.clipsToBounds = true
    //$0.imageEdgeInsets = UIEdgeInsets(top: edge2, left: edge2, bottom: edge2, right: edge2)
  }
  private let titleLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 14)
    $0.textColor = .black
    $0.textAlignment = .center
  }
  private let enTitleLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 11)
    $0.textColor = #colorLiteral(red: 0.6055239439, green: 0.5373966098, blue: 0.3319360316, alpha: 1)
    $0.textAlignment = .center
  }
  private let discriptionLabel = UILabel().then {
    $0.font = UIFont.systemFont(ofSize: 12)
    $0.textColor = .black
    $0.textAlignment = .center
  }
  private let informButton = UIButton().then {
    $0.setTitle("영양정보를 확인해 보세요", for: .normal)
    $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    $0.tintColor = .white
    $0.backgroundColor = #colorLiteral(red: 0.4821513891, green: 0.4307640195, blue: 0.4033659697, alpha: 1)
    $0.layer.cornerRadius = 4
    $0.clipsToBounds = true
  }
  
  // MARK: Initialize
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    self.menuImageView.image = UIImage(named: "coffee")
    self.titleLabel.text = "아이스 카페 아메리카노"
    self.enTitleLabel.text = "Iced Caffe Americano"
    self.discriptionLabel.text = "강렬한 에스프레소 샷에 시원한 물의 조화"
    self.dismissButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
  }
  
  private func setupConstraints() {
    let guide = view.safeAreaLayoutGuide
    let spacing: CGFloat = 16
    let viewWidth = UIScreen.main.bounds.width
    let widthSize = viewWidth - 20
    
    self.backView.then { view.addSubview($0) }
      .snp.makeConstraints {
        $0.centerX.centerY.equalTo(guide)
        $0.width.equalTo(widthSize)
    }
    self.menuImageView.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.width.height.equalTo(widthSize)
        $0.top.leading.equalTo(backView)
    }
    self.dismissButton.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.width.height.equalTo(40)
        $0.trailing.top.equalToSuperview()
    }
    self.titleLabel.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(menuImageView.snp.bottom).offset(spacing)
        $0.centerX.equalToSuperview()
    }
    self.enTitleLabel.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(titleLabel.snp.bottom).offset(spacing / 3)
        $0.centerX.equalToSuperview()
    }
    self.discriptionLabel.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(enTitleLabel.snp.bottom).offset(spacing * 2)
        $0.centerX.equalToSuperview()
    }
    self.informButton.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(discriptionLabel.snp.bottom).offset(spacing * 3)
        $0.width.equalTo(widthSize - 20)
        $0.height.equalTo(43)
        $0.centerX.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-spacing)
    }
  }
  
  // MARK: Action
  @objc func didTapButton(_ sender: UIButton) {
    print("dismiss")
    self.dismiss(animated: true)
  }
}
