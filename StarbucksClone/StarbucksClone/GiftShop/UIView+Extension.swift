//
//  UIView+Extension.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/05/29.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

extension UIView {
  func parentView<T: UIView>(of type: T.Type) -> T? {
    guard let view = superview else {
      return nil
    }
    return (view as? T) ?? view.parentView(of: T.self)
  }
  
  var parentViewController: UIViewController? {
    var responder: UIResponder? = self
    while let nextResponder = responder?.next {
      responder = nextResponder
      if let viewController = nextResponder as? UIViewController {
        return viewController
      }
    }
    return nil
  }
}

extension UIButton {
  func seletedBackgroudColor(_ seleted: Bool) {
    if seleted {
      self.backgroundColor = .red
    } else {
      self.backgroundColor = .white
    }
  }
}

extension CALayer {
  
  func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
    let border = CALayer()
    let lineWidth = frame.width * 0.8
    
    switch edge {
    case .bottom:
      border.frame = CGRect(x: (frame.width - lineWidth) / 2,
                            y: frame.height - thickness,
                            width: lineWidth,
                            height: thickness)
    case .left:
      border.frame = CGRect(x: -5,
                            y: 0,
                            width: thickness,
                            height: frame.height)
    case .right:
      border.frame = CGRect(x: frame.width + 5 ,
                            y: 0,
                            width: thickness,
                            height: frame.height + 10)
    default:
      break
    }
    border.backgroundColor = color.cgColor
    addSublayer(border)
  }
  
  func addViewBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
    let border = CALayer()
    
    switch edge {
    case .top:
      border.frame = CGRect(x: 0,
                            y: 0,
                            width: frame.width,
                            height: thickness)
    case .bottom:
      border.frame = CGRect(x: 0,
                            y: frame.height - thickness,
                            width: frame.width,
                            height: thickness)
    default:
      break
    }
    border.backgroundColor = color.cgColor
    addSublayer(border)
  }
}
