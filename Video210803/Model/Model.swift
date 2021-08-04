//
//  Model.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import Foundation

struct Welcome: Codable {
    let videos: [Video]
}

class Video: Codable {
    
    let url: String
    let image: String
    let user: User
    let videoFiles: [VideoFile]
    let videoPictures: [VideoPicture]
    
    enum CodingKeys: String, CodingKey {
        case user
        case url
        case image
        case videoFiles = "video_files"
        case videoPictures = "video_pictures"
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let url: String
}

struct VideoFile: Codable {
    let id: Int
    let link: String
}

struct VideoPicture: Codable {
    let id : Int
    let picture: String
}
