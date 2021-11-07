//
//  CountryTableViewCell.swift
//  covid19
//
//  Created by Z.Seckin on 4.11.2021.
//

import Foundation
import UIKit
import SDWebImage

final class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryIconImageView: UIImageView!
    
    public var viewModel: ViewModel? {
        didSet {
            guard let model = viewModel else {
                return
            }
            initView(model: model)
        }
    }
    
    func initView(model: ViewModel) {
        countryNameLabel.text = model.name
        countryIconImageView.sd_setImage(with: URL(string: model.icon))
    }
    
}

extension CountryTableViewCell {
    struct ViewModel {
        let name: String
        let icon: String
    }
}
