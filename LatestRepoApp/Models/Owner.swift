//
//  Owner.swift
//  LatestRepoApp
//
//  Created by Stuti on 10/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Owner: Codable {
    let avatarUrl: URL?
    let name: String?
    let type: String?
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
        case name = "login"
        case type
    }
}
