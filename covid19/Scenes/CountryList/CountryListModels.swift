//
//  CountryListModels.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

enum CountryList {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var response: [CountryListResponse]
            
        }
        
        struct ViewModel {
            let items: [CountryTableViewCell.ViewModel]
        }
        
    }
    
}
