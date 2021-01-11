//
//  GalleryNetworkService.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import Alamofire
//
//protocol NetworkServiceProtocol {
//    func getImages(completion: @escaping (Result<[Images]?, Error>) -> Void)
//}
//
//class NetworkService: NetworkServiceProtocol {
//    func getImages(completion: @escaping (Result<[Images]?, Error>) -> Void) {
//        let urlString = "https://api.unsplash.com/photos/?client_id=LhHtMGggUmhSDV6W9Aks2qGu55WBQUNZdFtO6jEpFSo"
//        
//        AF.request(urlString, method: .get, parameters: nil).responseJSON { (responce) in
//            switch responce.result {
//            case .failure(let error):
//                print(error)
//            case .success(let value):
//                if let arrayDictionary = value as? [[String: Any]] {
//                    do {
//                        let data = try JSONSerialization.data(withJSONObject: arrayDictionary, options: .fragmentsAllowed)
//                        print(data)
//                        let result = try JSONDecoder().decode([Images].self, from: data)
//                        completion(.success(result))
//                        print(result)
//                    } catch {
//                        completion(.failure(error))
//                        print(error)
//                    }
//                }
//                
//            }
//        }.resume()
//    }
//}
