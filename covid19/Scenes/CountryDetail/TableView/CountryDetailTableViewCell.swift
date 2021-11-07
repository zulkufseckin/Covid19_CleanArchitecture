//
//  CountryDetailTableViewCell.swift
//  covid19
//
//  Created by Z.Seckin on 4.11.2021.
//

import Foundation
import UIKit

final class CountryDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func set(key: String, value: String) {
        keyLabel.text = key
        valueLabel.text = value
    }
    
}

