//
//  TamagotchiType.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation

enum TamagotchiType{
    case plain
    case takkeum
    case bangsil
    case banzzak
    
    var title: String{
        switch self{
        case .takkeum: return "따끔따끔다마고치"
        case .bangsil: return "방실방실다마고치"
        case .banzzak: return "반짝반짝다마고치"
        case .plain: return "다마고치"
        }
    }
    var imageNum: Int{
        switch self{
        case .takkeum: return 1
        case .bangsil: return 2
        case .banzzak: return 3
        case .plain: return 0
        }
    }
    
}
