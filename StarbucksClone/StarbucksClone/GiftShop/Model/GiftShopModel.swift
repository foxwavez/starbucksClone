//
//  GiftShopModel.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/29.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSViewSize {
  static let shared = GSViewSize()
  
  var navigationBarHeight: CGFloat = 0
  let segementHeight: CGFloat = 56
}

struct GiftDetailItem {
  let image: UIImage
  let title: String
  let subtitle: String
  let price: Int
}

struct GSCollectionItem: Decodable {
  var image: URL?
  var title: String
  var price: String
}
