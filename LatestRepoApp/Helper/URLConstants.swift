//
//  URLConstants.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()
enum URLConstants {
    private static let BASE_URL = "https://api.github.com/"
    case searchRepository, repoDetail(Int)
    
    var url: URL? {
        return URL(string: "\(URLConstants.BASE_URL)\(endPoint)")
    }
    private var endPoint: String {
        switch self {
        case .searchRepository:
            return "search/repositories?q=ios&sort=stars&order=desc"
        case .repoDetail(let id):
            return "repositories/\(id)"
        }
    }
}

enum HTTPMethod {
    case get
    var type: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}
