//
//  SettingMenu.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/07.
//

import UIKit

enum SettingMenu: CaseIterable{
    case setName
    case changeTama
    case reset
    
    var contents: String {
        switch self {
        case .setName: return "내 이름 설정하기"
        case .changeTama: return "다마고치 변경하기"
        case .reset: return "데이터 초기화"
        }
    }
    var icon: String {
        switch self{
        case .setName: return Icon.pencil
        case .changeTama: return Icon.moon
        case .reset: return Icon.refresh
        }
    }
    var subContents: String {
        switch self {
        case .setName: return UserDefaults.standard.string(forKey: "nickname") ?? ""
        case .changeTama: return ""
        case .reset: return ""
        }
    }
   
}
