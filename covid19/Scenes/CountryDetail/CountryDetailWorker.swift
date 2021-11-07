//
//  CountryDetailWorker.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation
import Alamofire

protocol CountryDetailWorkingLogic: AnyObject {
    func getCountryDetail(_ country: String, _ completion: @escaping ((DataResponse<CountryDetailResponse, AFError>) -> Void))
}

final class CountryDetailWorker: CountryDetailWorkingLogic {
    func getCountryDetail(_ country: String, _ completion: @escaping ((DataResponse<CountryDetailResponse, AFError>) -> Void)) {
    
        AF.request(Constants.baseURL + country).validate().responseDecodable(of: CountryDetailResponse.self, completionHandler: completion)
    }
    
}
