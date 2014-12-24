//
//  MinorCategoryTableViewCell.swift
//  UITableViewDemo
//
//  Created by ruby on 14-12-24.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import UIKit

class MinorCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var bugetLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
