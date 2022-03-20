//
//  Video.swift
//  onedaybuild
//
//  Created by Tj on 3/12/22.
//  Copyright © 2022 Yusif Tijani. All rights reserved.
//

import Foundation

struct Video : Decodable {
    
    var channelId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        
        case channelId
        case title
        case description
        case thumbnail = "url"
        case published = "publishedAt"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse the title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // Parse the description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // Parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse the thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        self.thumbnail = try thumbnailContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse channelId
        self.channelId = try snippetContainer.decode(String.self, forKey: .channelId)
        
    }
}
