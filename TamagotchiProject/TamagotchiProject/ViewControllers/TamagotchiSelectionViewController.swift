//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/04.
//

import UIKit

class TamagotchiSelectionViewController: UIViewController,InitialSetting {
    var list = TamagotchiSelectionInfo().list
    
    static let identifier = "TamagotchiSelectionViewController"
    

    @IBOutlet var tamagotchiCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension TamagotchiSelectionViewController: InitialSetting{
    func initUI() {
        <#code#>
    }
    
    func initData() {
        <#code#>
    }
}

