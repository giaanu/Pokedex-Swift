//
//  ApiManager.swift
//  Pokedex
//
//  Created by Gianluca Zarrelli on 09/06/2022.
//

import Foundation
import Alamofire

class ApiManager {
    
    static let shared = ApiManager()
    
    // GET / POST / DELETE / UPDATE
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void){
        AF.request(url).response { response in
            completion(response.result)
        }
    }
}
