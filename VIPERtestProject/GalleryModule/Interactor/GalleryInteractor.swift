//
//  GalleryInteractor.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import Alamofire

protocol GalleryInteractorProtocol {
    func getImages(_ completion: @escaping (_ cars: [Images]?)-> Void)
}

class GalleryInteractor: GalleryInteractorProtocol {
    
    let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getImages(_ completion: @escaping ([Images]?)-> Void) {
        networkService.getImages { (result) in
            
            guard let result = result else {
                completion([])
                return
            }
            completion(result)
        }
    }
    
    
}
