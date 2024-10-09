//
//  BannerView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/6/24.
//

import SwiftUI

struct BannerView: View {
    var body: some View {
        VStack(spacing: 0) {
            Color(red: 38/255, green: 38/255, blue: 37/255)
                .frame(height: 70)
                .edgesIgnoringSafeArea(.top)

            Image("banner")  // Replace "banner" with the actual image name
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: 100)
                .clipped()
        }
        .frame(width: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.top)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
