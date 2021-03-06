//
//  CountryListPresenter.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

protocol CountryListPresentationLogic: AnyObject {
    func presentCountryList(response: CountryList.Fetch.Response)
    func presentError()
}

final class CountryListPresenter: CountryListPresentationLogic {
    weak var viewController: CountryListDisplayLogic?
    
    func presentCountryList(response: CountryList.Fetch.Response) {
        let countryList = getCountryList(response: response.response)
        viewController?.displayCountryList(viewModel: CountryList.Fetch.ViewModel(items: countryList))
    }
    
    func getCountryList(response: [CountryListResponse]) -> [CountryTableViewCell.ViewModel] {
        var countryList = [CountryTableViewCell.ViewModel]()
        
        for item in response {
            if let countryName = item.country, let flag = item.countryInfo?.flag {
                countryList.append(CountryTableViewCell.ViewModel(name: countryName, icon: flag))
            }
        }
        return countryList
    }
    
    func presentError() {
        viewController?.displayError()
    }

}
