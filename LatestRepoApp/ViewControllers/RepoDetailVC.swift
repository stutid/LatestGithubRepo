//
//  RepoDetailVC.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class RepoDetailVC: UIViewController {
    //MARK:- Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    var repoDetailVM: RepoDetailVM!
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        repoDetailVM.uidelegate = self
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(getRepoDetail), userInfo: nil, repeats: true)
    }
    
    @objc private func getRepoDetail() {
        repoDetailVM.getRepoDetail()
    }
}

//MARK:- UITableView Extensions
extension RepoDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RepoDetailInfo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == RepoDetailInfo.image.rawValue {
            let identifier = String.getName(for: ImageCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ImageCell
            cell.setItem(from: repoDetailVM.getRepoItem())
            return cell
        } else {
            let identifier = String.getName(for: LabelCell.self)
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LabelCell
            let (header, title) = repoDetailVM.getRepoInfo(for: indexPath.row)
            cell.setRepo(header, and: title)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == RepoDetailInfo.image.rawValue {
            return 200
        }
        return UITableView.automaticDimension
    }
}

//MARK:- Custom Delegate Extensions
extension RepoDetailVC: UIDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func show(message: String) {
        DispatchQueue.main.async {
            self.showAlert(with: message)
        }
    }
}
