//
//  BaseViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation
@objc
protocol InitialSetting{
    @objc optional func initUI()
    @objc optional func initData()
}
