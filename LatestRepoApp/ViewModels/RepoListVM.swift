//
//  RepoListVM.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation

class RepoListVM {
    //MARK:- Properties
    private let apiManager = ApiManager.shared
    private var repoItems = [Item]()
    weak var uidelegate: UIDelegate?
    
    //MARK:- Methods
    init() {
        fetchGithubRepo()
    }
    
    func getRepoItemsCount() -> Int {
        return repoItems.count
    }
    
    func getRepoItem(at index: Int) -> Item? {
        return repoItems[index]
    }
    
    private func fetchGithubRepo() {
        let url = URLConstants.searchRepository.url
        let request = apiManager.createRequest(url: url, method: .get)
        apiManager.fetch(request: request) { [weak self] (data, error) in
            guard let data = data else {
                self?.uidelegate?.show(message: error?.localizedDescription ?? "")
                return
            }
            do {
                self?.repoItems.removeAll()
                let repos = try JSONDecoder().decode(Repositories.self, from: data)
                if let items = repos.item {
                    self?.repoItems.append(contentsOf: items)
                }
                self?.uidelegate?.updateUI()
            } catch {
                self?.uidelegate?.show(message: error.localizedDescription)
            }
        }
    }
}
