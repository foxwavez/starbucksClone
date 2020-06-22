//
//  GiftShopItemModel.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/20.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

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
