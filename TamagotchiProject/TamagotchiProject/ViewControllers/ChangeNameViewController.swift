//
//  ChangeNameViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class ChangeNameViewController: UIViewController,InitialSetting{
    static let identifier = "ChangeNameViewController"

    @IBOutlet var nameTextFieldBarView: UIView!
    @IBOutlet var nameTextField: UITextField!
    let placeholder = "대장님의 이름을 적어주세요"
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    
    }
    func initUI() {
        nameTextField.borderStyle = .none
        nameTextField.placeholder = placeholder
        nameTextFieldBarView.backgroundColor = TMUIColor.borderColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(registerButtonTapped))
        navigationItem.title = "대장님 이름 정하기"
        
        navigationItem.leftBarButtonItem?.tintColor = TMUIColor.fontColor
        
        navigationItem.rightBarButtonItem?.tintColor = TMUIColor.fontColor
    }
    
    @objc func registerButtonTapped(){
        let name = nameTextField.text!
        if(2..<6 ~= name.count){
            UserDefaults.standard.set(name, forKey: "nickname")
            navigationController?.popViewController(animated: true)
        }
       
    }
    

}
