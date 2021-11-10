//
//  CountryDetailPresenter.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

protocol CountryDetailPresentationLogic: AnyObject {
    func presentCountryDetail(response: CountryDetail.Fetch.Response)
    func presentError()
}

final class CountryDetailPresenter: CountryDetailPresentationLogic {
    
    weak var viewController: CountryDetailDisplayLogic?
    
    func presentCountryDetail(response: CountryDetail.Fetch.Response) {
        
        let country = response.response.country
        let cases = response.response.cases
        let todayCases = response.response.todayCases
        let deaths = response.response.deaths
        let recovered = response.response.recovered
        let countryInfo = response.response.countryInfo
        
        viewController?.displayCountryDetail(viewModel: CountryDetail.Fetch.ViewModel(country: country, cases: cases, todayCases: todayCases, deaths: deaths, recovered: recovered, countryInfo: countryInfo))
    }
    
    func presentError() {
        viewController?.displayError()
    }
    
}
