//
//  ViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/04.
//

import UIKit
enum SelectionType{
    case new
    case change
}
class TamagotchiSelectionViewController: UIViewController,InitialSetting {
    var list = TamagotchiSelectionInfo().list
    
    static let identifier = "TamagotchiSelectionViewController"
    let totalCellNum = 25
    var viewType = SelectionType.new
    

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
        view.backgroundColor = TMUIColor.backgroundColor
        selectionCollectionView.backgroundColor = .clear
        switch viewType {
        case .new:
            navigationItem.title = "다마고치 선택하기"
        case .change:
            navigationItem.title = "다마고치 변경하기"
        }
       
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewType{
        case .change:
            if indexPath.row < list.count{
                guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {return}
                let data = list[indexPath.row]
                vc.name = data.titleName
                vc.imageName = data.thumbnailImageName
                vc.introduction = data.introduction
                vc.type = data.type
                vc.viewType = viewType
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
            }
        case .new:
            if indexPath.row < list.count{
                guard let vc = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else {return}
                let data = list[indexPath.row]
                vc.name = data.titleName
                vc.imageName = data.thumbnailImageName
                vc.introduction = data.introduction
                vc.type = data.type
                vc.viewType = viewType
                vc.modalTransitionStyle = .coverVertical
                vc.modalPresentationStyle = .overFullScreen
                present(vc, animated: true)
            }
        }
       
    }
    
}
