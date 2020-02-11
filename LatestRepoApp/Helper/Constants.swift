//
//  Constants.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

enum Key {
    static let OK = "OK"
    static let Loading = "Loading..."
    static let NA = "Not Specified"
    static let GithubRepo = "GitHub Repositories"
    static let Description = "Description"
    static let Language = "Language used"
    static let Stars = "Stars"
    static let HomePage = "URL"
    static let License = "License"
}

enum Storyboard: String {
    case main = "Main"
}

enum RepoDetailInfo: Int, CaseIterable {
    case image, description, language, stars, homepage, license
    
    var headerTitle: String {
        switch self {
        case .description:
            return Key.Description
        case .language:
            return Key.Language
        case .stars:
            return Key.Stars
        case .homepage:
            return Key.HomePage
        case .license:
            return Key.License
        default:
            return ""
        }
    }
}
