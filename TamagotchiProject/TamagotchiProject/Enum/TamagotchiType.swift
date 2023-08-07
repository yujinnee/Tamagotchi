//
//  TamagotchiType.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation

enum TamagotchiType: String{
    case takkeum = "takkeum"
    case bangsil = "bangsil"
    case banzzak = "banzzak"
    
    var title: String{
        switch self{
        case .takkeum: return "따끔따끔다마고치"
        case .bangsil: return "방실방실다마고치"
        case .banzzak: return "반짝반짝다마고치"
        }
    }
    var imageNum: Int{
        switch self{
        case .takkeum: return 1
        case .bangsil: return 2
        case .banzzak: return 3
        }
    }
    var introduction: String{
        switch self{
        case .takkeum:
            return "저는 선인장 다마고치입니다. 키는 2cm 몸무게는 150g 이에요. 성격은 소심하지만 마음은 따뜻해요. 열심히 잘 먹고 잘 클 자신은 있답니다. 반가워요 주인님~:) "
        case .bangsil:
            return "저는 방실방실 다마고치입니당! 키는 100km 몸무게는 150톤이에용! 성격은 화끈하고 날라다닙니당! 열심히 잘 먹고 잘 클 자신은 있답니당! 방실방실!"
        case .banzzak:
            return "저는 반짝반짝 다마고치에요~ 키는 120cm 몸무게는 120g이에요~ 성격도 반짝반짝 시원시원 해요~ 저를 키워주세요~ 잘 먹고 잘 커볼게요~"
        }
    }
    
}
