//
//  Sermon.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import Foundation

struct Sermon: Identifiable, Codable {
    var id: UUID?  // Optional to handle missing UUIDs
    var title: String
    var description: String
    var pastorName: String
    var videoURL: URL?
    var audioURL: URL?
    var thumbnailName: String
}
