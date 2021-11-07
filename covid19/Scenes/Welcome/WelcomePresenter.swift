//
//  WelcomePresenter.swift
//  covid19
//
//  Created by Z.Seckin on 2.11.2021.
//

import UIKit

protocol WelcomePresentationLogic: AnyObject {
    func presentCountryList()
}

final class WelcomePresenter: WelcomePresentationLogic {
    weak var viewController: WelcomeDisplayLogic?
        
    func presentCountryList() {
        viewController?.displayCountryList()
    }
}
