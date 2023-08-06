//
//  TamagotchiCollectionViewCell.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class TamagotchiCollectionViewCell: UICollectionViewCell,InitialSetting {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        initData()
    }
    
    func initUI() {
        thumbnailImageView.layer.cornerRadius = 15
        thumbnailImageView.layer.borderColor = TMUIColor.borderColor.cgColor
        thumbnailImageView.layer.borderWidth = 3
    }
    
    func initData() {
        nameLabel.text = "준비중이에요"
    }
    
    func setData(tamagotchi: Tamagotchi){
        nameLabel.text = tamagotchi
    }

}
