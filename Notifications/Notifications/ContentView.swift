//
//  ContentView.swift
//  Notifications
//
//  Created by Vyshnavi Koleti on 10/12/23.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Request Permission"){
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] ){ success, error in
                    if success{
                        print("Good to Go!")
                    }
                    else if let error = error{
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Reminder 1"){
                ScheduleNotification(title: "Drink Water!", subtitle: "You look thirsty!", timeInterval: 5)
//                let content = UNMutableNotificationContent()
//                content.title = "Drink Water!"
//                content.subtitle = "You look thirsty"
//                content.sound = UNNotificationSound.default
            }
            Button("Reminder 2"){
                ScheduleNotification(title: "Take a break!", subtitle: "You've been working hard", timeInterval: 10)
//                let content = UNMutableNotificationContent()
//                content.title = "Take a break!"
//                content.subtitle = "You've been working hard"
//                content.sound = UNNotificationSound.default
            }
            
            }
        }
    func ScheduleNotification(title: String, subtitle: String, timeInterval: TimeInterval){
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
                    
        }
    }

#Preview {
    ContentView()
}
