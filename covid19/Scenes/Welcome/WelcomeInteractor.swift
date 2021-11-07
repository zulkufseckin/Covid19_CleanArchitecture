//
//  WelcomeInteractor.swift
//  covid19
//
//  Created by Z.Seckin on 2.11.2021.
//

import UIKit

protocol WelcomeBusinessLogic: AnyObject {
    func checkForceUpdate()
}

protocol WelcomeDataStore: AnyObject {
    
}

final class WelcomeInteractor: WelcomeBusinessLogic, WelcomeDataStore {
    
    var presenter: WelcomePresentationLogic?
    var worker: WelcomeWorkingLogic = WelcomeWorker()
    
    // MARK: Do something
    
    func checkForceUpdate() {
        self.presenter?.presentCountryList()
    }
    
}
