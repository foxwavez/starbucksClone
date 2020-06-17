//
//  SirenOrderMenuTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

protocol SirenOrderTableViewProtocol: class {
  func showDetailPage()
}

class SirenOrderMenuTableViewCell: UITableViewCell {
  
  // MARK: Property
  
  weak var delegate: SirenOrderTableViewProtocol?
  static let identifier = "SirenOrderTVC"
  
  // MARK: Views
  
  private let viewWidth = UIScreen.main.bounds.width
  private let backView = UIView().then {
    $0.backgroundColor = .white
    $0.layer.cornerRadius = 4
  }
  var sectionTitleLabel = UILabel().then {
    $0.font = UIFont.boldSystemFont(ofSize: 14)
    //$0.font = UIFont.systemFont(ofSize: 13)
    $0.text = "안나님을 위한 추천 메뉴"
    $0.textColor = .black
  }
  private let flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var menuCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: viewWidth - 16, height: 130), collectionViewLayout: flowLayout).then {
    $0.showsHorizontalScrollIndicator = false
    $0.backgroundColor = .clear
  }
  
  // MARK: Initialize
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupUI() {
    self.contentView.backgroundColor = .clear
    setupCollectionView()
    setupConstraints()
  }
  
  private func setupCollectionView() {
    menuCollectionView.dataSource = self
    menuCollectionView.delegate = self
    menuCollectionView.register(SirenOrderMenuCollectionViewCell.self, forCellWithReuseIdentifier: SirenOrderMenuCollectionViewCell.identifier)
  }
  
  private func setupConstraints() {
    let spacing: CGFloat = 16
    let leadingSpacing: CGFloat = 20
    
    self.backView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.bottom.equalToSuperview().inset(spacing / 4)
        $0.leading.trailing.equalToSuperview().inset(spacing / 2)
    }
    self.sectionTitleLabel.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(spacing * 1.5)
        $0.leading.equalToSuperview().offset(leadingSpacing)
    }
    self.menuCollectionView.then { self.backView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(sectionTitleLabel.snp.bottom).offset(spacing / 2)
        $0.leading.equalTo(sectionTitleLabel)
        $0.trailing.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-spacing)
    }
  }
}

// MARK:- UICollectionViewDataSource

extension SirenOrderMenuTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SirenOrderMenuCollectionViewCell.identifier, for: indexPath) as? SirenOrderMenuCollectionViewCell else { return UICollectionViewCell() }
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout

extension SirenOrderMenuTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 110, height: 120)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("\(indexPath.row)클릭")
    delegate?.showDetailPage()
  }
}
