//
//  CountryListResponse.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

struct CountryListResponse: Codable {
    let country: String?
    let countryInfo: CountryInfo?
    let cases, todayCases, deaths, todayDeaths: Int?
    let recovered, active, critical, casesPerOneMillion: Int?
    let deathsPerOneMillion, tests, testsPerOneMillion: Int?
}

struct CountryInfo: Codable {
    let id: Int?
    let iso2, iso3: String?
    let lat, long: Double?
    let flag: String?

}
