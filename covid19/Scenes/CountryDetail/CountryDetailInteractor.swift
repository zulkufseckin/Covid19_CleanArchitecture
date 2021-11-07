//
//  CountryDetailInteractor.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation

protocol CountryDetailBusinessLogic: AnyObject {
    func fetchCountryDetail(request: CountryDetail.Fetch.Request)
}

protocol CountryDetailDataStore: AnyObject {
    var country: String { get set }
}

final class CountryDetailInteractor: CountryDetailBusinessLogic, CountryDetailDataStore {
    
    var presenter: CountryDetailPresentationLogic?
    var worker: CountryDetailWorkingLogic = CountryDetailWorker()
    
    var country: String = ""
    
    func fetchCountryDetail(request: CountryDetail.Fetch.Request) {
        worker.getCountryDetail(country) { [weak self] response in
            switch response.result {
            case let .success(response):
                self?.presenter?.presentCountryDetail(response: CountryDetail.Fetch.Response(response: response))
            case .failure:
                self?.presenter?.presentError()
            }
        }
    }
    
}
