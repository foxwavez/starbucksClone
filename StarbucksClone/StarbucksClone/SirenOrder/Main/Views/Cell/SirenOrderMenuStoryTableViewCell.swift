//
//  SirenOrderMenuStoryTableViewCell.swift
//  StarbucksClone
//
//  Created by Mac mini on 2020/06/16.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class SirenOrderMenuStoryTableViewCell: UITableViewCell {
  
  // MARK: Property
  static let identifier = "SirenOrderMenuStoryTVC"
  let viewWidth = UIScreen.main.bounds.width
  let items = ["menuStory0", "menuStory1", "menuStory2", "menuStory3"]
  
  // MARK: Views
  private let starbucksLabel = UILabel().then {
    $0.text = "STARBUCKS"
    $0.textColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 10)
  }
  private let menustoryLabel = UILabel().then {
    $0.text = "메뉴 이야기"
    $0.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    $0.font = UIFont.systemFont(ofSize: 13)
  }
  private let lineView = UIView().then {
    $0.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
  }
  private let flowLayout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .horizontal
  }
  private lazy var menuStoryCollectionView = UICollectionView(frame: CGRect(x: 0, y: 80, width: viewWidth, height: viewWidth / 5), collectionViewLayout: flowLayout).then {
    $0.showsHorizontalScrollIndicator = false
    $0.backgroundColor = .darkGray
  }
  
  // MARK: Initailize
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    self.contentView.backgroundColor = .darkGray
    setupCollectionView()
  }
  
  private func setupCollectionView() {
    self.menuStoryCollectionView.dataSource = self
    self.menuStoryCollectionView.delegate = self
    self.menuStoryCollectionView.register(SirenOrderMenuStoryCollectionViewCell.self, forCellWithReuseIdentifier: SirenOrderMenuStoryCollectionViewCell.identifier)
  }
  
  private func setupConstraints() {
    let lineWidth: CGFloat = viewWidth - 30
    self.starbucksLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalToSuperview().offset(10)
        $0.centerX.equalToSuperview()
    }
    self.menustoryLabel.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(starbucksLabel.snp.bottom).offset(2)
        $0.centerX.equalToSuperview()
    }
    self.lineView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(menustoryLabel.snp.bottom).offset(10)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(lineWidth)
        $0.height.equalTo(1)
    }
    self.menuStoryCollectionView.then { self.contentView.addSubview($0) }
      .snp.makeConstraints {
        $0.top.equalTo(lineView.snp.bottom).offset(10)
        $0.leading.trailing.equalToSuperview()
        $0.bottom.equalToSuperview().offset(-10).priority(500)
    }
  }
}
// MARK:- UICollectionViewDataSource
extension SirenOrderMenuStoryTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SirenOrderMenuStoryCollectionViewCell.identifier, for: indexPath) as? SirenOrderMenuStoryCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(image: UIImage(named: items[indexPath.item]))
    cell.backgroundColor = .darkGray
    return cell
  }
}

// MARK:- UICollectionViewDelegateFlowLayout
extension SirenOrderMenuStoryTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: viewWidth / 5 * 2, height: viewWidth / 4)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 5, bottom: 20, right: 5)
  }
}
