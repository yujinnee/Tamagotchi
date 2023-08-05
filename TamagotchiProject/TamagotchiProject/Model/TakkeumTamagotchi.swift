//
//  TakkeumTamagotchi.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation

class TakkeumTamagotchi: Tamagotchi,TamagotchiProtocol{
    var type = TamagotchiType.Takkeum
    var imageName: String {
        return "\(type.imageNum)-\(level)"
    }
    var titleName: String {
        return type.title
    }
    
}
