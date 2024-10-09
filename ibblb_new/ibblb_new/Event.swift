//
//  Event.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/6/24.
//

import Foundation

struct Event: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String
    var date: String
    var thumbnailName: String  // For the image name reference in Assets
}
