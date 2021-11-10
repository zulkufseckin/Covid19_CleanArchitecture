//
//  CountryDetailModels.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

enum CountryDetail {
    
    enum Fetch {
        
        struct Request {
            
        }
        
        struct Response {
            var response: CountryDetailResponse
        }
        
        struct ViewModel {
            let country: String?
            let cases: Int?
            let todayCases: Int?
            let deaths: Int?
            let recovered: Int?
            let countryInfo: CountryInfo?
        }
        
    }
    
}
