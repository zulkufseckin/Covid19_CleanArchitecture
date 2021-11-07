//
//  CountryListRouter.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import UIKit

protocol CountryListRoutingLogic: AnyObject {
    func routeToCountryDetail(country: String)
}

protocol CountryListDataPassing: AnyObject {
    var dataStore: CountryListDataStore? { get }
}

final class CountryListRouter: CountryListRoutingLogic, CountryListDataPassing {
    
    weak var viewController: CountryListViewController?
    var dataStore: CountryListDataStore?
    
    func routeToCountryDetail(country: String) {
        let bundle = Bundle(for: CountryDetailViewController.self)
        let storyboard = UIStoryboard(name: "CountryDetail", bundle: bundle)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CountryDetailViewController") as! CountryDetailViewController
        destinationVC.router?.dataStore?.country = country
        viewController?.present(destinationVC, animated: true)
    }
    
}
