//
//  TamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell,InitialSetting {
    static let identifier = "TamagotchiCollectionViewCell"
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!

    @IBOutlet var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        initData()
    }
    
    func initUI() {
        backgroundColor = .clear
        
        thumbnailImageView.layer.borderColor = TMUIColor.borderColor.cgColor
        
        nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.textColor = TMUIColor.fontColor
        
        borderView.layer.borderWidth = 0.5
        borderView.layer.borderColor = TMUIColor.borderColor.cgColor
        borderView.layer.cornerRadius = 3
        borderView.backgroundColor = TMUIColor.backgroundColor
        
        
    }
    func initData() {
        setEmptyData()
    }
    func setData(tamagotchi: Tamagotchi){
        nameLabel.text = tamagotchi.titleName
        thumbnailImageView.image = UIImage(named:"\(tamagotchi.type.imageNum)-6")
    }
    func setEmptyData(){
        nameLabel.text = "준비중이에요"
        thumbnailImageView.image = UIImage(named: "noImage")
    }

}
