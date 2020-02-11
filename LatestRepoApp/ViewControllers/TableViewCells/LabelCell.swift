//
//  LabelCell.swift
//  LatestRepoApp
//
//  Created by Stuti on 09/02/20.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet private weak var headerLbl: UILabel!
    @IBOutlet private weak var lbl: UILabel!
    
    //MARK:- Methods
    func setRepo(_ headerTitle: String, and title: String?) {
        headerLbl.text = headerTitle
        lbl.text = title
    }
}
