//
//  Notificationview.swift
//  QuickCuts
//
//  Created by Akshay Jha on 12/09/24.
//

import SwiftUI



struct Notification: Identifiable {
    let id = UUID()
    let salonName: String
    let time: String
    let message: String
}

struct NotificationView: View {
    
    let notifications = [
        Notification(salonName: "Ramesh Salon", time: "9:30 AM", message: "Your appointment scheduled for tomorrow has been cancelled."),
        Notification(salonName: "Suresh Salon", time: "10:45 AM", message: "Due to unforeseen circumstances, your appointment has been cancelled."),
        Notification(salonName: "Aone Salon", time: "11:15 AM", message: "We regret to inform you that your appointment has been cancelled."),
        Notification(salonName: "Fresha Salon", time: "12:00 PM", message: "Your booking has been cancelled as the stylist is unavailable.")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Today")
                    .font(.custom("Poppins-Regular", size: 24).bold())
                    .fontWeight(.bold)
                    .padding(.leading)
                
                ForEach(notifications) { notification in
                    NotificationRow(notification: notification)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical)
        }.clipped()
        .background(Color(.systemGroupedBackground))
    }
}

struct NotificationRow: View {
    
    let notification: Notification
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: "bell.fill")
                .foregroundColor(Color("buttonColor"))
                .font(.custom("Poppins-Regular", size: 18))
                .padding(.top, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(notification.salonName)
                        .font(.custom("Poppins-Regular", size: 18).bold())
                    Spacer()
                    Text(notification.time)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 2)
    }
}

#Preview {
    NotificationView()
}

