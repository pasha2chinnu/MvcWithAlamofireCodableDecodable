//
//  PostsCell.swift
//  MVC
//
//  Created by kvana_imac11 on 23/01/20.
//  Copyright © 2020 kvana_imac11. All rights reserved.
//

import UIKit

class PostsCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
