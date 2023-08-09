//
//  DetailViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class DetailViewController: UIViewController,InitialSetting {
    static let identifier = "DetailViewController"
    var tamagotchi: Tamagotchi?
    var viewType =  SelectionType.new
    
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
    var type: TamagotchiType?
    var imageName: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
        
    }
    func initUI() {
        
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        
        alertBackgroundView.backgroundColor = TMUIColor.backgroundColor
        
        borderLineView.layer.borderColor = TMUIColor.borderColor.cgColor
        borderLineView.layer.borderWidth = 0.5
        borderLineView.layer.cornerRadius = 3
        borderLineView.backgroundColor = TMUIColor.backgroundColor
        
        titleLabel.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        titleLabel.textColor = TMUIColor.fontColor
        
        lineView.backgroundColor = TMUIColor.borderColor
        
        introductionLabel.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        introductionLabel.numberOfLines = 0
        introductionLabel.textAlignment = .center
        introductionLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        introductionLabel.textColor = TMUIColor.fontColor
        
        underLineView.backgroundColor = .lightGray
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.backgroundColor = .systemGray5
        cancelButton.tintColor = TMUIColor.fontColor
        
        switch viewType {
        case .new:
            startButton.setTitle("시작하기", for: .normal)
            
        case .change:
            startButton.setTitle("변경하기", for: .normal)
            
        }
        startButton.tintColor = TMUIColor.fontColor
    }
    
    func initData() {
        titleLabel.text = name ?? "이름"
        introductionLabel.text = introduction ?? "소개"
        thumbnailImageView.image = UIImage(named: imageName ?? "noImage" ) ?? UIImage()
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        switch viewType {
        case .new:
            
            UserDefaults.standard.set("대장", forKey: "nickname")
     
            
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc =  sb.instantiateViewController(identifier: MainViewController.identifier) as? MainViewController else{return}
            
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
            
            let tamagotchi = ["type": type?.rawValue ?? 0,"feed": 0,"water": 0]
            UserDefaults.standard.setValue(tamagotchi, forKey: "tamagotchi")
            UserDefaults.standard.set(true, forKey: "isLaunched")
            
        case .change:
            
            guard let savedTamagotchiDictionary = UserDefaults.standard.dictionary(forKey: "tamagotchi") as? [String:Int] else {return}
//            let tamaGotchitype = TamagotchiType(rawValue: savedTamagotchiDictionary["type"] ?? 0) ?? TamagotchiType.bangsil
            let feedNum = savedTamagotchiDictionary["feed"]
            let waterNum = savedTamagotchiDictionary["water"]
            
//            tamagotchi = Tamagotchi(type: type?.rawValue , feed: feedNum ?? 0, water: waterNum ?? 0)
            
            let newTamagotchi = ["type": type?.rawValue ,"feed": feedNum,"water": waterNum]
            UserDefaults.standard.setValue(newTamagotchi, forKey: "tamagotchi")
       
           
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let sceneDelegate = windowScene?.delegate as? SceneDelegate
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            guard let vc =  sb.instantiateViewController(identifier: MainViewController.identifier) as? MainViewController else{return}
            
            let nav = UINavigationController(rootViewController: vc)
            
            sceneDelegate?.window?.rootViewController = nav
            sceneDelegate?.window?.makeKeyAndVisible()
//            dismiss(animated: true)
//            navigationController?.popViewController(animated: true)
        }
        
        
        
        
    }
    
    
}
