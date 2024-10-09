//
//  SplashView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            // Replace with your custom logo
            Image("logo_long_smaller icon WHITE") // Ensure that your logo is in the assets folder with this name
                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)  // Adjust logo size as needed
                                .padding()
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)  // Ensure the VStack fills the entire screen
                        .background(Color.black)  // Set the background color to white
                        .edgesIgnoringSafeArea(.all)  // Ensure the splash screen covers the entire screen
                    }
                }

                struct SplashView_Previews: PreviewProvider {
                    static var previews: some View {
                        SplashView()
                    }
                }
