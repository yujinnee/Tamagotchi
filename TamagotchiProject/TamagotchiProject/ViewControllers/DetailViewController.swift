//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController,InitialSetting {
    static let identifier = "DetailViewController"

    @IBOutlet var alertBackgroundView: UIView!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var borderLineView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var lineView: UIView!
    @IBOutlet var introductionLabel: UILabel!
    @IBOutlet var underLineView: UIView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    var name: String?
    var introduction: String?
    var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()

    }
    func initUI() {
        alertBackgroundView.backgroundColor = TMUIColor.backgroundColor
        
        borderLineView.layer.borderColor = TMUIColor.borderColor.cgColor
        borderLineView.layer.borderWidth = 1
        borderLineView.layer.cornerRadius = 3
        borderLineView.backgroundColor = TMUIColor.backgroundColor
        
        titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        titleLabel.textColor = TMUIColor.fontColor
        
        lineView.backgroundColor = TMUIColor.borderColor
        
        introductionLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        
        underLineView.backgroundColor = .lightGray
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .systemGray5
        cancelButton.tintColor = TMUIColor.fontColor
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.tintColor = TMUIColor.fontColor
    }
    
    func initData() {
        titleLabel.text = name ?? "이름"
        introductionLabel.text = introduction ?? "소개"
        thumbnailImageView.image = UIImage(named: imageName ?? "noImage" ) ?? UIImage()
    }
    


}
