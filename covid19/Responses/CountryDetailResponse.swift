//
//  CountryDetailResponse.swift
//  covid19
//
//  Created by Z.Seckin on 4.11.2021.
//

import Foundation

struct CountryDetailResponse: Codable {
    let country: String?
    let countryInfo: CountryInfo?
    let cases, todayCases, deaths, todayDeaths: Int?
}
