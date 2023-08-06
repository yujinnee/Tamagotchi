//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit

class MainViewController: UIViewController,InitialSetting {
    static let identifier = "MainViewController"

    @IBOutlet var bubbleImageView: UIImageView!
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var tamagotchiImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var borderLineView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var feedTextField: UITextField!
    @IBOutlet var feedTextFieldBarView: UIView!
    @IBOutlet var feedButton: UIButton!
    @IBOutlet var waterTextField: UITextField!
    @IBOutlet var waterButton: UIButton!
    @IBOutlet var waterTextFieldBarView: UIView!
    
    var message: String?
    var imageName: String?
    var name: String?
    var info: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
        setKeyboardObserver()

    
    }
    func initUI() {
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleImageView.tintColor = TMUIColor.borderColor
        
        messageLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        messageLabel.textColor = TMUIColor.fontColor
        
        borderLineView.layer.borderColor = TMUIColor.borderColor.cgColor
        borderLineView.layer.borderWidth = 1
        borderLineView.layer.cornerRadius = 3
        borderLineView.backgroundColor = TMUIColor.backgroundColor
        
        nameLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        nameLabel.textColor = TMUIColor.fontColor
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        descriptionLabel.textColor = TMUIColor.fontColor
        

        feedTextField.borderStyle = .none
        feedTextField.textAlignment = .center
        feedTextField.placeholder = "밥주세용"
        feedTextFieldBarView.backgroundColor = TMUIColor.borderColor
        
        waterTextField.borderStyle = .none
        waterTextField.textAlignment = .center
        waterTextField.placeholder = "물주세용"
        waterTextFieldBarView.backgroundColor = TMUIColor.borderColor
        
        feedButton.imageView?.image = Icon.feed
        feedButton.setImage(Icon.feed, for: .normal)
        feedButton.setTitle("밥먹기", for: .normal)
        feedButton.tintColor = TMUIColor.borderColor
        feedButton.layer.borderColor = TMUIColor.borderColor.cgColor
        feedButton.layer.borderWidth = 1
        
        waterButton.setImage(Icon.water, for: .normal)
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.tintColor = TMUIColor.borderColor
        waterButton.layer.borderColor = TMUIColor.borderColor.cgColor
        waterButton.layer.borderWidth = 1
        
    }
    
    func initData() {
        messageLabel.text = message ?? "다마고치의 메시지"
        tamagotchiImageView.image = UIImage(named: imageName ?? "noImage") ?? UIImage()
        nameLabel.text = name ?? "다마고치 이름"
        descriptionLabel.text = info ?? "다마고치 정보"
        
    }
    @IBAction func viewDidTap(_ sender: Any) {
        view.endEditing(true)
    }
}

extension MainViewController {
    
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
          if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                  let keyboardRectangle = keyboardFrame.cgRectValue
                  let keyboardHeight = keyboardRectangle.height
              UIView.animate(withDuration: 1) {
                  self.view.window?.frame.origin.y -= keyboardHeight
              }
          }
      }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.window?.frame.origin.y != 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
                UIView.animate(withDuration: 1) {
                    self.view.window?.frame.origin.y += keyboardHeight
                }
            }
        }
    }
}


