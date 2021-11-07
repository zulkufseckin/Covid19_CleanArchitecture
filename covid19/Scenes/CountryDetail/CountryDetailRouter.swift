//
//  CountryDetailRouter.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

protocol CountryDetailRoutingLogic: AnyObject {
    
}

protocol CountryDetailDataPassing: AnyObject {
    var dataStore: CountryDetailDataStore? { get }
}

final class CountryDetailRouter: CountryDetailRoutingLogic, CountryDetailDataPassing {
    
    weak var viewController: CountryDetailViewController?
    var dataStore: CountryDetailDataStore?
    
}
