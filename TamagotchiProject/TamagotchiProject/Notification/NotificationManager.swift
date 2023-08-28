//
//  NotificationManager.swift
//  TamagotchiProject
//
//  Created by 이유진 on 2023/08/21.
//

import UIKit

// notification center에 등록 했는지 유저 디폴츠에 저장해놓고고  분기 처리해야하나?
struct NotificationManager{
    static let shared = NotificationManager()
    
    func addFeedNotification() {
        let content = UNMutableNotificationContent()
        content.title = "대장님 배가 고파요"
        content.body = "다마고치에게 밥과 물을 주세요!!"
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: 19,minute: 30), repeats: true)
//        UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: true)
        
        let request = UNNotificationRequest(identifier: "\(Date())", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request){ error in
            print(error)
        }
    }
}
