//
//  Conference.swift
//  ibblb_new
//
//  Created by jovani Hernandez on 10/1/24.
//

import Foundation

struct Conference: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let startDate: Date
    let endDate: Date
}
