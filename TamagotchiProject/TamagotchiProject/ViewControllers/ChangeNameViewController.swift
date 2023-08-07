//
//  ChangeNameViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class ChangeNameViewController: UIViewController,InitialSetting{

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
        
    }
    

}
