//
//  Repositories.swift
//  LatestRepoApp
//
//  Created by Stuti on 10/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

struct Repositories: Codable {
    let item: [Item]?
    
    private enum CodingKeys: String, CodingKey {
        case item = "items"
    }
}
