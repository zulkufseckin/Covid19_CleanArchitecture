//
//  CountryListWorker.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import Foundation
import Alamofire

protocol CountryListWorkingLogic: AnyObject {
    func getCountryList(_ completion: @escaping ((DataResponse<[CountryListResponse], AFError>) -> Void))
}

final class CountryListWorker: CountryListWorkingLogic {
    func getCountryList(_ completion: @escaping ((DataResponse<[CountryListResponse], AFError>) -> Void)) {
        AF.request(Constants.baseURL).validate().responseDecodable(of: [CountryListResponse].self, completionHandler: completion)
    }
}
