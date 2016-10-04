//
//  NormalModeTableViewCell.swift
//  masterHTML
//
//  Created by 迫 佑樹 on 2016/10/03.
//  Copyright © 2016年 Yuki Sako. All rights reserved.
//

import UIKit

class NormalModeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
