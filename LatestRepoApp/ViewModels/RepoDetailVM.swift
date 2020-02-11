//
//  RepoDetailVM.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

class RepoDetailVM {
    //MARK:- Properties
    private var apiManager = ApiManager.shared
    private var selectedRepo: Item?
    weak var uidelegate: UIDelegate?
    
    //MARK:- Methods
    init(with selectedRepo: Item?) {
        self.selectedRepo = selectedRepo
    }
    
    func getRepoItem() -> Item? {
        return selectedRepo
    }
    
    func getRepoInfo(for index: Int) -> (String, String) {
        var repoInfo: (String, String) = ("", "")
        switch index {
        case RepoDetailInfo.description.rawValue:
            repoInfo = (RepoDetailInfo.description.headerTitle, selectedRepo?.description ?? Key.NA)
        case RepoDetailInfo.language.rawValue:
            repoInfo = (RepoDetailInfo.language.headerTitle, selectedRepo?.language ?? Key.NA)
        case RepoDetailInfo.stars.rawValue:
            repoInfo = (RepoDetailInfo.stars.headerTitle, "\(selectedRepo?.starCount ?? 0) \(Key.Stars)")
        case RepoDetailInfo.homepage.rawValue:
            var homepage = Key.NA
            if let repoHomepage = selectedRepo?.homepage, !repoHomepage.isEmpty {
                homepage = repoHomepage
            }
            repoInfo = (RepoDetailInfo.homepage.headerTitle, homepage)
        case RepoDetailInfo.license.rawValue:
            repoInfo = (RepoDetailInfo.license.headerTitle, selectedRepo?.license?.name ?? Key.NA)
        default:
            break
        }
        return repoInfo
    }
    
    func getRepoDetail() {
        let url = URLConstants.repoDetail(self.selectedRepo?.id ?? 0).url
        let request = apiManager.createRequest(url: url, method: .get)
        apiManager.fetch(request: request) { [weak self] (data, error) in
            guard let data = data else {
                self?.uidelegate?.show(message: error?.localizedDescription ?? "")
                return
            }
            do {
                self?.selectedRepo = try JSONDecoder().decode(Item.self, from: data)
                self?.uidelegate?.updateUI()
            } catch {
                self?.uidelegate?.show(message: error.localizedDescription)
            }
        }
    }
}
