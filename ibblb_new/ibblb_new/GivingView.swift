//
//  GivingView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct GivingView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Banner at the top
            VStack(spacing: 0) {
                Color(red: 38/255, green: 38/255, blue: 37/255)
                                .frame(height: 70)
                                .edgesIgnoringSafeArea(.top)
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .clipped()
                    .padding(.top, 0) // Adjust as needed

                Color(red: 38/255, green: 38/255, blue: 37/255)
                    .frame(height: 0)
            }
            .frame(width: UIScreen.main.bounds.width)
            .edgesIgnoringSafeArea(.top)

            // Main Content
            ScrollView {
                VStack(spacing: 20) {
                    Text("Tithes & Offerings")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Trust God with your finances by giving your first 10% back to Him.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 20)
                    
                    Text("$0")
                        .font(.system(size: 50, weight: .bold))
                    
                    // Sharefaith Giving button
                    Button(action: {
                        // Add action for Sharefaith Giving
                    }) {
                        HStack {
                            Text("Give with")
                            Image(systemName: "creditcard")
                            Text("Sharefaith Giving")
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width * 0.9)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                    // Manage account
                    Text("Manage Your Account & Scheduled Gifts")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}

struct GivingView_Previews: PreviewProvider {
    static var previews: some View {
        GivingView()
    }
}

