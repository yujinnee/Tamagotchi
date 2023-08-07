//
//  TamagotchiInfo.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/05.
//

import Foundation

protocol TamagotchiProtocol{
//    var type: TamagotchiType {get}
}

class Tamagotchi {
    var type: TamagotchiType
    var level: Int = 1
    let maximumRice = 99
    let maximumDrop = 49
    var minimumLevel = 1
    var maximumLevel = 10
    var rice:Int = 0{
        willSet {
            if newValue > maximumRice{
                self.rice = maximumRice
            }
        }
    }
    var drop:Int = 0{
        willSet {
            if newValue > maximumDrop{
                self.rice = maximumDrop
            }
        }
    }
    var imageName: String {
          get {
              return "\(type.imageNum)-\(level)"
          }
         
      }
    var thumbnailImageName: String {
        get{
            return "\(type.imageNum)-6"
        }
    }
    var titleName: String {
         get {
             return type.title
         }
      }
    var introduction: String {
        get {
            return type.introduction
        }
    }
    init(type: TamagotchiType){
        self.type = type
    }
    
    func getLevel() -> Int {
        var computedLevel = Int(Float(rice)/5 + Float(drop)/2)
        if computedLevel < minimumLevel {computedLevel = minimumLevel}
        if computedLevel > maximumLevel {computedLevel = maximumLevel}
        return computedLevel
    }
    func getRandomMessage(userName: String) -> String{
        var db = Message()
        var messageList = [String]()
        messageList = db.list.map{$0.replacingOccurrences(of: "$사용자이름$", with: userName)}
        return messageList.randomElement() ?? "메세지가 없습니다."
    }
}
