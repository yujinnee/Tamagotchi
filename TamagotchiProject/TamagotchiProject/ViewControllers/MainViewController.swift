//
//  MainViewController.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import UIKit
enum FeedValidationError: Error{
    case tooMany
    case isNotInt
}
enum WaterValidationError: Error{
    case tooMany
    case isNotInt
}

class MainViewController: UIViewController,InitialSetting {
    static let identifier = "MainViewController"
    var tamagotchi: Tamagotchi?
    var userName = UserDefaults.standard.string(forKey: "nickname")
    
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
        setNavigationBar()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        userName = UserDefaults.standard.string(forKey: "nickname")
        navigationItem.title = "\(userName!)의 다마고치"
        messageLabel.text = tamagotchi?.getRandomMessage(userName: userName ?? "") ?? "다마고치의 메시지"
        
        
    }
    func initUI() {
        view.backgroundColor = TMUIColor.backgroundColor
        
        bubbleImageView.image = UIImage(named: "bubble")
        bubbleImageView.tintColor = TMUIColor.borderColor
        
        messageLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        messageLabel.textColor = TMUIColor.fontColor
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        borderLineView.layer.borderColor = TMUIColor.borderColor.cgColor
        borderLineView.layer.borderWidth = 0.5
        borderLineView.layer.cornerRadius = 3
        borderLineView.backgroundColor = TMUIColor.backgroundColor
        
        nameLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        nameLabel.textColor = TMUIColor.fontColor
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        descriptionLabel.textColor = TMUIColor.fontColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        
        feedTextField.borderStyle = .none
        feedTextField.textAlignment = .center
        feedTextField.placeholder = "밥주세용"
        feedTextFieldBarView.backgroundColor = TMUIColor.borderColor
        
        waterTextField.borderStyle = .none
        waterTextField.textAlignment = .center
        waterTextField.placeholder = "물주세용"
        waterTextFieldBarView.backgroundColor = TMUIColor.borderColor
        
        feedButton.imageView?.image = UIImage(systemName: Icon.feed)
        feedButton.setImage(UIImage(systemName: Icon.feed), for: .normal)
        feedButton.setTitle("밥먹기", for: .normal)
        feedButton.tintColor = TMUIColor.borderColor
        feedButton.layer.borderColor = TMUIColor.borderColor.cgColor
        feedButton.layer.borderWidth = 1
        feedButton.layer.cornerRadius = 5
        
        waterButton.setImage(UIImage(systemName: Icon.water), for: .normal)
        waterButton.setTitle("물먹기", for: .normal)
        waterButton.tintColor = TMUIColor.borderColor
        waterButton.layer.borderColor = TMUIColor.borderColor.cgColor
        waterButton.layer.borderWidth = 1
        waterButton.layer.cornerRadius = 5
        
        userName = UserDefaults.standard.string(forKey: "nickname")
        
    }
    
    func setNavigationBar(){
        navigationItem.title = "\(userName!)의 다마고치"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(profileDidTap))
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : TMUIColor.fontColor]
        self.navigationController?.navigationBar.tintColor = TMUIColor.fontColor
        
    }
    @objc
    func profileDidTap(){
        guard let vc = storyboard?.instantiateViewController(identifier: SettingViewController.identifier) as? SettingViewController else {return}
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func initData() {
        //        let tamagotchiDictionary = [String:Int]()
        
        guard let savedTamagotchiDictionary = UserDefaults.standard.dictionary(forKey: "tamagotchi") as? [String:Int] else {return}
        let type = TamagotchiType(rawValue: savedTamagotchiDictionary["type"] ?? 0) ?? TamagotchiType.bangsil
        let feedNum = savedTamagotchiDictionary["feed"]
        let waterNum = savedTamagotchiDictionary["water"]
        
        tamagotchi = Tamagotchi(type: type , feed: feedNum ?? 0, water: waterNum ?? 0)
        
        messageLabel.text = tamagotchi?.getRandomMessage(userName: userName ?? "") ?? "다마고치의 메시지"
        tamagotchiImageView.image = UIImage(named: tamagotchi?.imageName ?? "") ?? UIImage()
        nameLabel.text = tamagotchi?.titleName ?? "다마고치 이름"
        descriptionLabel.text = tamagotchi?.description ?? "다마고치 정보"
        
        
    }
    
    func validateFeedIntput(text:String) throws ->Bool{
        guard Int(text) != nil else{
            throw FeedValidationError.isNotInt
        }
        guard Int(text)! < 100 else{
            throw FeedValidationError.tooMany
        }
        return true
        
    }
    @IBAction func feedButtonTapped(_ sender: UIButton) {
        let text = feedTextField.text ?? ""
        do {
            let result = try validateFeedIntput(text: text)
            if text == ""{
                tamagotchi?.rice += 1
            }else{
                tamagotchi?.rice += Int(text)!
                
            }
            descriptionLabel.text = tamagotchi?.description
            messageLabel.text = tamagotchi?.getRandomMessage(userName: userName ?? "")
            tamagotchiImageView.image = UIImage(named: tamagotchi?.imageName ?? "noImage") ?? UIImage()
            
            let newTamagotchi = ["type": tamagotchi?.type.rawValue ,"feed": tamagotchi?.rice,"water": tamagotchi?.drop]
            UserDefaults.standard.setValue(newTamagotchi, forKey: "tamagotchi")
        }catch{
            print(error)
        }
        
        
    }
    func validateWaterIntput(text:String) throws ->Bool{
        guard Int(text) != nil else{
            throw WaterValidationError.isNotInt
        }
        guard Int(text)! < 50 else{
            throw WaterValidationError.tooMany
        }
        return true
        
    }
    
    
    @IBAction func waterButtonDidTapped(_ sender: UIButton) {
        let text = waterTextField.text ?? ""
        do{
            let result = try validateWaterIntput(text: text)
            if text == ""{
                tamagotchi?.drop += 1
            }else {
                tamagotchi?.drop += Int(text)!
            }
            descriptionLabel.text = tamagotchi?.description
            messageLabel.text = tamagotchi?.getRandomMessage(userName: userName ?? "")
            tamagotchiImageView.image = UIImage(named: tamagotchi?.imageName ?? "noImage") ?? UIImage()
            
            let newTamagotchi = ["type": tamagotchi?.type.rawValue ,"feed": tamagotchi?.rice,"water": tamagotchi?.drop]
            UserDefaults.standard.setValue(newTamagotchi, forKey: "tamagotchi")
        }catch{
            print(error)
        }
        
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


