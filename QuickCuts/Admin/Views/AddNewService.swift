//
//  AddNewService.swift
//  QuickCuts
//
//  Created by Akshay Jha on 15/09/24.
//
import SwiftUI

struct AddNewServiceView: View {
    @State private var serviceName: String = ""
    @State private var price: String = ""
    @State private var duration: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.init("textColor"))
                            .font(.title2)
                            
                    }
                
                    Text("Add Service")
                        .font(.custom("Poppins-Regular", size: 24).bold())
                        .foregroundColor(.init("textColor"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.trailing, 22)
                    
                     
                }
                .padding(.top, 10)
                
                Button(action: {
                    isImagePickerPresented = true
                }, label: {
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    else {
                        Image("food_14")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                })
                .sheet(isPresented: $isImagePickerPresented, content: {
                    ImagePicker(selectedImage: $selectedImage, isPresented: $isImagePickerPresented)
                })
                
                VStack(alignment: .leading) {
                    Text("Service Name")
                        .foregroundColor(.init("textColor"))
                        .fontWeight(.medium)
                    TextField("Enter service name", text: $serviceName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                VStack(alignment: .leading) {
                    Text("Price")
                        .foregroundColor(.init("textColor"))
                        .fontWeight(.medium)
                    TextField("Enter price", text: $price)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                
                Button(action: {
                    // Save service action
                }) {
                    Text("Add")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("buttonColor"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                
            }
            .padding(.horizontal, 16)
        }
        .clipped()
        .navigationBarHidden(true)
    }
}

struct AddNewServiceView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewServiceView()
    }
}
