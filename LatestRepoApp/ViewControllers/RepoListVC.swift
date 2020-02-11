//
//  RepoListVC.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit
import SVProgressHUD

class RepoListVC: UIViewController {
    //MARK:- Outlets and Properties
    @IBOutlet weak var tableView: UITableView!
    private var repoListVM = RepoListVM()
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        repoListVM.uidelegate = self
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.show(withStatus: Key.Loading)
        navigationItem.title = Key.GithubRepo
    }
}

//MARK:- UITableView Extensions
extension RepoListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoListVM.getRepoItemsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String.getName(for: ListCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ListCell
        cell.setItem(from: repoListVM.getRepoItem(at: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let identifier = String.getName(for: RepoDetailVC.self)
        if let repoDetailVC = UIStoryboard(name: Storyboard.main.rawValue, bundle: nil).instantiateViewController(withIdentifier: identifier) as? RepoDetailVC {
            let selectedRepo = repoListVM.getRepoItem(at: indexPath.row)
            repoDetailVC.repoDetailVM = RepoDetailVM(with: selectedRepo)
            navigationController?.pushViewController(repoDetailVC, animated: true)
        }
    }
}

//MARK:- Custom Delegate Extensions
extension RepoListVC: UIDelegate {
    func updateUI() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
        }
    }
    
    func show(message: String) {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            self.showAlert(with: message)
        }
    }
}
