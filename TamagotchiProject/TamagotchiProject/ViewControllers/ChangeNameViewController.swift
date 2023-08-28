//
//  ChangeNameViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit
enum NicknameValidationError: Error{
    case invalidletterCount
}

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
        view.backgroundColor = TMUIColor.backgroundColor
        
        nameTextField.borderStyle = .none
        nameTextField.placeholder = placeholder
        nameTextFieldBarView.backgroundColor = TMUIColor.borderColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(registerButtonTapped))
        navigationItem.title = "대장님 이름 정하기"
        
//        navigationItem.leftBarButtonItem?.tintColor = TMUIColor.fontColor
//        
//        navigationItem.rightBarButtonItem?.tintColor = TMUIColor.fontColor
    }
    
    
    func validateInputNum(text: String) throws -> Bool{
        
        guard 2..<6 ~= text.count else {
            throw NicknameValidationError.invalidletterCount
        }
        return true
    }
    
    @objc func registerButtonTapped(){
        let name = nameTextField.text!
        do{
            let result = try validateInputNum(text: name)
            UserDefaults.standard.set(name, forKey: "nickname")
            NotificationCenter.default.post(name: NSNotification.Name("nickname"), object: nil,userInfo: ["name" : name])
            navigationController?.popViewController(animated: true)
            
        }catch{
            print(error)
        }
       
    }
    

}
