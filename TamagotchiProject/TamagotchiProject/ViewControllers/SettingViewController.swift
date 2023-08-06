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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegate()

    }
    
    func registerCell(){
        let nib = UINib(nibName: SettingTableViewCell.identifier, bundle: nil)
        settingTableView.register(nib, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    func setDelegate(){
        settingTableView.dataSource = self
        settingTableView.delegate = self
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
}
