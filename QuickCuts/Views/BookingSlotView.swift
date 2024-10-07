//
//  BookingSlotView.swift
//  QuickCuts
//
//  Created by Akshay Jha on 07/09/24.
//

import SwiftUI

struct BookingView: View {
    
    let dates = ["Yesterday", "Today", "Tomorrow", "4", "5", "6"]
    let timeSlots = ["9:00 AM", "10:00 AM", "11:00 AM", "1:00 PM", "2:00 PM", "3:00 PM"]
    @State private var selectedDate = 1
    @State private var selectedTimeSlot: String? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    VStack(spacing: 16) {
                                            Text("Book Your Slot")
                                                .font(.custom("Poppins-Regular", size: 24).bold())
                                        }
                   
                    
                    VStack(spacing: 20) {
                        Text("Choose a Date")
                            .font(.custom("Poppins-Bold", size: 18))
                            .fontWeight(.semibold)
                            .padding(.top, 20)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(0..<dates.count) { index in
                                    VStack(spacing: 4) {
                                        Text(dates[index])
                                            .font(.custom("Poppins-Regular", size: 16))
                                            .fontWeight(selectedDate == index ? .bold : .regular)
                                            .foregroundColor(selectedDate == index ? .white : .black)
                                        if index >= 3 {
                                            Text("Oct")
                                                .font(.custom("Poppins-Regular", size: 14))
                                                .foregroundColor(selectedDate == index ? .white : .gray)
                                        }
                                    }
                                    .frame(width: 100, height: 60)
                                    .background(selectedDate == index ? Color("buttonColor") : Color.white)
                                    .cornerRadius(10)
                                 
                                    .onTapGesture {
                                        selectedDate = index
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    VStack(spacing: 20) {
                        Text("Available Time Slots")
                            .font(.custom("Poppins-Regular", size: 18))
                            .fontWeight(.semibold)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(timeSlots, id: \.self) { slot in
                                    Text(slot)
                                        .font(.custom("Poppins-Regular", size: 16))
                                        .fontWeight(selectedTimeSlot == slot ? .bold : .regular)
                                        .foregroundColor(selectedTimeSlot == slot ? .white : .black)
                                        .padding(.vertical, 15)
                                        .frame(width: 100)
                                        .background(selectedTimeSlot == slot ? Color("buttonColor") : Color.white)
                                        .cornerRadius(10)
                                      
                                        .onTapGesture {
                                            selectedTimeSlot = slot
                                        }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    Button(action: {}) {
                        Text("Confirm Booking")
                            .font(.custom("Poppins-Regular", size: 16))
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color("buttonColor"))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
            .clipped()
            .background(Color(UIColor.systemGray6))
            .edgesIgnoringSafeArea(.bottom)
       
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}

