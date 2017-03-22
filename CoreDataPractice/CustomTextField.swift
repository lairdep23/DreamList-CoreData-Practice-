//
//  CustomTextField.swift
//  CoreDataPractice
//
//  Created by Evan on 3/22/17.
//  Copyright © 2017 Evan. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5.0
    }

}
