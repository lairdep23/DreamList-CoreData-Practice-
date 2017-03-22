//
//  ItemCell.swift
//  CoreDataPractice
//
//  Created by Evan on 3/22/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var thumbImage: UIImageView!
    
    func configureCell(item: Item) {
        
        titleLabel.text = item.title
        priceLabel.text = "\(item.price)"
        detailLabel.text = item.details
    }
    

}
