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
    let totalCellNum = 25
    

    @IBOutlet var selectionCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
        registerCell()
        setDelegate()
        setCollectionViewLayout()
    }
    
    func initUI() {
        navigationItem.title = "다마고치 선택하기"
    }
    
    func registerCell(){
        let xib = UINib(nibName: TamagotchiCollectionViewCell.identifier, bundle: nil)
        selectionCollectionView.register(xib, forCellWithReuseIdentifier: TamagotchiCollectionViewCell.identifier)
    }
    func setDelegate(){
        selectionCollectionView.dataSource = self
        selectionCollectionView.delegate = self
    }
    func setCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 150)
        selectionCollectionView.collectionViewLayout = layout
    }


}

extension TamagotchiSelectionViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.identifier, for: indexPath) as? TamagotchiCollectionViewCell else {return UICollectionViewCell()}
        if indexPath.row<list.count{
            cell.setData(tamagotchi: list[indexPath.row])
        }else{
            cell.setEmptyData()
        }
        return cell
                
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalCellNum
    }
    
}
