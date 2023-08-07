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
    var level: Int {
        let computedLevel = (Int(Float(rice)/5 + Float(drop)/2))/10
        if computedLevel == 0{
            return computedLevel + 1
        }else if 1...10 ~= computedLevel {
            return computedLevel
        }else{
            return 10
        }
    }
    let maximumRice = 987654321
    let maximumDrop = 987654321
    var minimumLevel = 1
    var maximumLevel = 10
    var rice:Int = 0
    {
        willSet {
            if newValue > maximumRice{
                self.rice = maximumRice
            }
        }
    }
    var drop:Int = 0
//    {
//        willSet {
//            if newValue > maximumDrop{
//                self.rice = maximumDrop
//            }
//        }
//    }
    var imageName: String {
          get {
              if(level==10){
                  return "\(type.imageNum)-\(level-1)"
              }
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
    var description: String {
        get{
            return "LV\(level) · 밥알\(rice)개 · 물방울\(drop)개"
        }
    }
    init(type: TamagotchiType){
        self.type = type
    
        }
    init(type: TamagotchiType,feed:Int,water: Int){
        self.type = type
        self.rice = feed
        self.drop = water
    }

    
//    func getLevel() -> Int {
//        var computedLevel = Int(Float(rice)/5 + Float(drop)/2)
//        if computedLevel < minimumLevel {computedLevel = minimumLevel}
//        if computedLevel > maximumLevel {computedLevel = maximumLevel}
//        return computedLevel
//    }
    func getRandomMessage(userName: String) -> String{
        var db = Message()
        var messageList = [String]()
        messageList = db.list.map{$0.replacingOccurrences(of: "$사용자이름$", with: userName)}
        return messageList.randomElement() ?? "메세지가 없습니다."
    }
}
