//
//  WelcomeRouter.swift
//  covid19
//
//  Created by Z.Seckin on 2.11.2021.
//

import UIKit

protocol WelcomeRoutingLogic: AnyObject {
    func routeToCountryList()
}

protocol WelcomeDataPassing: AnyObject {
    var dataStore: WelcomeDataStore? { get }
}

final class WelcomeRouter: NSObject, WelcomeRoutingLogic, WelcomeDataPassing {
    
    weak var viewController: WelcomeViewController?
    var dataStore: WelcomeDataStore?
        
    func routeToCountryList() {
        let bundle = Bundle(for: CountryListViewController.self)
        let storyboard = UIStoryboard(name: "CountryList", bundle: bundle)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "CountryListViewController") as! CountryListViewController
        let navigationController = UINavigationController(rootViewController: destinationVC)
        navigationController.modalPresentationStyle = .fullScreen
        viewController?.present(navigationController, animated: true)
        
    }
    
}
