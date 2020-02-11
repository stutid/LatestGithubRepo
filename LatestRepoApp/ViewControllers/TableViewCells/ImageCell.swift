//
//  ImageCell.swift
//  LatestRepoApp
//
//  Created by Stuti on 10/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet private weak var imgView: UIImageView!
    @IBOutlet weak var headerLbl: UILabel!
    @IBOutlet weak var lbl: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.roundCorners()
    }
    
    func setItem(from repoItem: Item?) {
        imgView.getImage(from: repoItem?.owner?.avatarUrl)
        headerLbl.text = repoItem?.owner?.name
        lbl.text = repoItem?.owner?.type
    }
}
