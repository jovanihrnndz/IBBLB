//
//  BannerView.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/6/24.
//

import SwiftUI

struct BannerView: View {
    let imageName: String
    let height: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            Color(red: 38/255, green: 38/255, blue: 37/255)
                .frame(height: 70)
                .edgesIgnoringSafeArea(.top)

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: height)
                .clipped()
        }
        .frame(width: UIScreen.main.bounds.width)
        .edgesIgnoringSafeArea(.top)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView(imageName: "banner", height: 100)
    }
}
