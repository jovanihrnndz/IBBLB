//
//  Sermon.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import Foundation

struct Sermon: Identifiable, Codable {
    var id: UUID?
    var title: String
    var description: String
    var pastorName: String
    var videoURL: URL?  // This holds the YouTube video URL
    var audioURL: URL?  // This holds the audio file URL
    var thumbnailName: String
}
