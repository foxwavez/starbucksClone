//
//  GSCollectionStyleView.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/19.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSCollectionStyleView: UIView {
  private let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 20, weight: .bold)
    $0.textColor = #colorLiteral(red: 0.2588235294, green: 0.2588235294, blue: 0.2588235294, alpha: 1)
  }
  
  private let subtitleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .regular)
    $0.textColor = #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1)
  }
  
  private lazy var layout = UICollectionViewFlowLayout().then {
    $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    $0.minimumInteritemSpacing = 0
    if items.count == 3 {
      $0.scrollDirection = .vertical
      $0.minimumLineSpacing = 10
      $0.itemSize = CGSize(width: UIScreen.main.bounds.width-16-16, height: 100)
    } else {
      $0.scrollDirection = .horizontal
      $0.minimumLineSpacing = 12
      $0.itemSize = CGSize(width: 120, height: 164)
    }
  }
  
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.backgroundColor = .white
    $0.dataSource = self
    $0.delegate = self
    if items.count == 3 {
      $0.register(GSThemeCollectionCell.self, forCellWithReuseIdentifier: "cell")
    } else {
      $0.register(GSBestNewCollectionCell.self, forCellWithReuseIdentifier: "cell")
      $0.showsHorizontalScrollIndicator = false
    }
  }
  
  private let items: [Any]
  
  init(items: [Any], title: String, subtitle: String) {
    self.items = items
    super.init(frame: .zero)
    titleLabel.text = title
    subtitleLabel.text = subtitle
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
    self.backgroundColor = .white
    [titleLabel, subtitleLabel, collectionView].forEach { self.addSubview($0) }
  }
  
  private func setupConstraints() {
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(24)
      $0.leading.equalToSuperview().offset(12)
    }
    subtitleLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-16)
      $0.centerY.equalTo(titleLabel.snp.centerY)
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(16)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalToSuperview().offset(-24)
    }
  }
  
}

extension GSCollectionStyleView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GSBestNewCollectionCell {
      if let item = items[indexPath.row] as? [UIImage: String] {
        cell.setItem(item)
      } else {
        cell.setItem([UIImage(named: "test")!: "찾을 수 없습니다"])
      }
      return cell
    } else {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GSThemeCollectionCell else { return UICollectionViewCell() }
      if let item = items[indexPath.row] as? UIImage {
        cell.setItem(item)
      } else {
        cell.setItem(UIImage(named: "test")!)
      }
      return cell
    }
  }
}

extension GSCollectionStyleView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? GSBestNewCollectionCell {
      print(items[indexPath.row])
    } else {
      guard let vc = self.superview?.parentViewController?.navigationController else { return }
      vc.pushViewController(GSThemeViewController(imageName: "test", data: [
      GSCollectionItem(image: nil, title: "zzz", price: "1234"),
      GSCollectionItem(image: nil, title: "zzz", price: "1234"),
      GSCollectionItem(image: nil, title: "zzz", price: "1234"),
      GSCollectionItem(image: nil, title: "zzz", price: "1234"),
      GSCollectionItem(image: nil, title: "zzz", price: "1234")
      ]), animated: true)
    }
  }
}
