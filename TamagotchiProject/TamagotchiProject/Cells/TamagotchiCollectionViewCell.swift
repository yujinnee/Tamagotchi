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

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
        initData()
    }
    
    func initUI() {
        thumbnailImageView.layer.borderColor = TMUIColor.borderColor.cgColor
        nameLabel.font = UIFont.systemFont(ofSize: 12)
        nameLabel.layer.borderWidth = 1
        nameLabel.layer.borderColor = TMUIColor.borderColor.cgColor
        
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
