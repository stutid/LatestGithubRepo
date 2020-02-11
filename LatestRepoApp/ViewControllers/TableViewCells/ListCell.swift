//
//  ListCell.swift
//  LatestRepoApp
//
//  Created by Stuti on 10/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet private weak var lbl: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setItem(from repoItem: Item?) {
        lbl.text = repoItem?.name
        imgView.getImage(from: repoItem?.owner?.avatarUrl)
    }
}
