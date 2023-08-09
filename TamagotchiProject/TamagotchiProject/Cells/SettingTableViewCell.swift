//
//  SettingTableViewCell.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/07.
//

import UIKit

class SettingTableViewCell: UITableViewCell,InitialSetting {
    static let identifier = "SettingTableViewCell"
    var nickName: String?

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var contentsLabel: UILabel!
    @IBOutlet var subContentsLabel: UILabel!
    @IBOutlet var chevronImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }

    func initUI() {
        backgroundColor = .clear
        iconImageView.tintColor = TMUIColor.fontColor
        chevronImageView.image = UIImage(systemName: "chevron.right") ?? UIImage()
        chevronImageView.tintColor = TMUIColor.fontColor
    }

    func setData(icon: String,contents:String,subContents:String){
        iconImageView.image = UIImage(systemName:icon)
        contentsLabel.text = contents
        subContentsLabel.text = subContents
        
    }
    
}
