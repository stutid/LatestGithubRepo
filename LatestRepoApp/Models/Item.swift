//
//  Item.swift
//  LatestRepoApp
//
//  Created by Stuti on 10/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Item: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let language: String?
    let starCount: Int?
    let homepage: String?
    let owner: Owner?
    let license: License?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case language
        case starCount = "stargazers_count"
        case homepage
        case owner
        case license
    }
}
