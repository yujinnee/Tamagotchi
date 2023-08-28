//
//  FeedButton.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/22.
//

import UIKit

@IBDesignable
class FeedButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat{
        get {return layer.cornerRadius}
        set { layer.cornerRadius = newValue}
    }
    
    @IBInspectable
    var borderWidth: CGFloat{
        get {return layer.borderWidth}
        set { layer.borderWidth = newValue}
    }
    
    @IBInspectable
    var borderColor: UIColor{
        get {return UIColor(cgColor: layer.borderColor!)}
        set { layer.borderColor = newValue.cgColor}
    }
}
