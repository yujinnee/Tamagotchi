//
//  SettingViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit


class SettingViewController: UIViewController {
    static let identifier = "SettingViewController"

    @IBOutlet var settingTableView: UITableView!
    var nickname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()
        setLayout()
        setNavigationBar()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        settingTableView.reloadData()

        let nickname = UserDefaults.standard.string(forKey: "nickname")
        
    }
    
    func registerCell(){
        let nib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    func setDelegate(){
        settingTableView.dataSource = self
        settingTableView.delegate = self
    }
    func setLayout(){
        view.backgroundColor = TMUIColor.backgroundColor
        settingTableView.backgroundColor = .clear
        
        
        let nickname = UserDefaults.standard.string(forKey: "nickname")
        
    }
    func setNavigationBar(){
        
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.topItem?.title = ""
        navigationItem.title = "설정"


    }
    func setTableView(){
        settingTableView.rowHeight = 50
    }
    
    @objc func previousButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
}

extension SettingViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingMenu.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {return UITableViewCell()}
        let icon = SettingMenu.allCases[indexPath.row].icon
        let contents = SettingMenu.allCases[indexPath.row].contents
        let subContents = SettingMenu.allCases[indexPath.row].subContents
        cell.setData(icon: icon, contents: contents, subContents: subContents)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: ChangeNameViewController.identifier) as? ChangeNameViewController else {return}
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            guard let vc = storyboard?.instantiateViewController(withIdentifier: TamagotchiSelectionViewController.identifier) as? TamagotchiSelectionViewController else {return}
            vc.viewType = .change
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가용?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "아냐!", style: .cancel)
                   let ok = UIAlertAction(title: "웅", style: .default){action in
                       
                       let newTamagotchi = ["type": TamagotchiType.bangsil.rawValue ,"feed": 0,"water": 0]
                       UserDefaults.standard.setValue(newTamagotchi, forKey: "tamagotchi")
                       UserDefaults.standard.set(false, forKey: "isLaunched")
                       UserDefaults.standard.set("", forKey: "nickname")
                       
                       let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
                             let sceneDelegate = windowScene?.delegate as? SceneDelegate
                             
                             let sb = UIStoryboard(name: "Main", bundle: nil)
                       let vc = sb.instantiateViewController(withIdentifier: TamagotchiSelectionViewController.identifier) as! TamagotchiSelectionViewController
                             
                             let nav = UINavigationController(rootViewController: vc)
                             
                             sceneDelegate?.window?.rootViewController = nav
                             sceneDelegate?.window?.makeKeyAndVisible()
                       
                   }
                   alert.addAction(cancel)
                   alert.addAction(ok)
                   present(alert, animated: true)
            
        default : return
        }
        
    }
}
