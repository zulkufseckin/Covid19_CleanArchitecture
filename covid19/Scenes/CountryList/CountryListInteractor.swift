//
//  CountryListInteractor.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

protocol CountryListBusinessLogic: AnyObject {
    func fetchCountryList(request: CountryList.Fetch.Request)
}

protocol CountryListDataStore: AnyObject {
    
}

final class CountryListInteractor: CountryListBusinessLogic, CountryListDataStore {
    
    var presenter: CountryListPresentationLogic?
    var worker: CountryListWorkingLogic = CountryListWorker()
    
    func fetchCountryList(request: CountryList.Fetch.Request) {
        worker.getCountryList { [weak self] response in
            switch response.result {
            case let .success(response):
                self?.presenter?.presentCountryList(response: CountryList.Fetch.Response(response: response))
            case .failure:
                self?.presenter?.presentError()
            }
        }
    }
    
}
