//
//  GSSearchViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/06/17.
//  Copyright © 2020 momo. All rights reserved.
//

import UIKit

class GSSearchViewController: UIViewController {
  
  private let baseView = UIView().then {
    $0.backgroundColor = .black
    $0.alpha = 0.6
  }
  
  private let searchView = UIView().then {
    $0.layer.cornerRadius = 6
    $0.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9490196078, alpha: 1)
  }
  
  private lazy var textField = UITextField().then {
    $0.placeholder = "선물명 또는 메뉴명을 입력하세요."
    $0.font = .systemFont(ofSize: 13)
    $0.borderStyle = .roundedRect
    $0.layer.borderColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
    $0.delegate = self
  }
  
  private let searchButton = UIButton().then {
    $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
    $0.transform = .init(scaleX: 0.8, y: 0.8)
    $0.tintColor = #colorLiteral(red: 0.4392156863, green: 0.4392156863, blue: 0.4392156863, alpha: 1)
  }
  
  private let resultView = UILabel().then {
    $0.backgroundColor = .white
    $0.text = "최근 검색어 내역이 없습니다."
    $0.textColor = #colorLiteral(red: 0.8196078431, green: 0.8196078431, blue: 0.8392156863, alpha: 1)
    $0.textAlignment = .center
  }
  
  private lazy var cancelButton = UIButton().then {
    $0.setTitle("취소", for: .normal)
    $0.setTitleColor(.black, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 13)
    $0.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupAttributes()
    setupConstraints()
  }
  
  private func setupAttributes() {
    view.addSubview(baseView)
    view.addSubview(searchView)
    [textField, searchButton, resultView, cancelButton].forEach {
      searchView.addSubview($0)
    }
  }
  
  private func setupConstraints() {
    baseView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    searchView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      $0.height.equalTo(308)
    }
    textField.snp.makeConstraints {
      $0.top.equalToSuperview().offset(16)
      $0.leading.equalToSuperview().offset(12)
      $0.trailing.equalTo(searchButton.snp.leading).offset(-28)
      $0.height.equalTo(40)
    }
    searchButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-28)
      $0.centerY.equalTo(textField.snp.centerY)
    }
    resultView.snp.makeConstraints {
      $0.top.equalTo(textField.snp.bottom).offset(16)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-32)
    }
    cancelButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-24)
      $0.top.equalTo(resultView.snp.bottom).offset(10)
      $0.bottom.equalToSuperview().offset(-8)
    }
  }
  
  @objc private func didTapCancelButton() {
    self.dismiss(animated: false)
  }
}

extension GSSearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
