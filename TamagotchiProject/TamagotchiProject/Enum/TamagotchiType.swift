//
//  TamagotchiType.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation

enum TamagotchiType{
    case Takkeum
    case Bangsil
    case Banzzack
    
    var title: String{
        switch self{
        case .Bangsil: return "방실방실다마고치"
        case .Banzzack: return "반짝반짝다마고치"
        case .Takkeum: return "따끔따끔다마고치"
        }
    }
    var imageNum: Int{
        switch self{
        case .Takkeum: return 1
        case .Bangsil: return 2
        case .Banzzack: return 3
        }
    }
    
}
