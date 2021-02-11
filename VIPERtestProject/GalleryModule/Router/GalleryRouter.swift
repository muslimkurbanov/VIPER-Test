//
//  GalleryRouter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import UIKit

protocol GalleryRouterProtocol {
    static func showGallery() -> GalleryViewController?
}

class GalleryRouter: GalleryRouterProtocol {
    
    let presentingViewController: UIViewController
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    static func showGallery() -> GalleryViewController? {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyViewController") as! GalleryViewController
        let router = GalleryRouter(presentingViewController: vc)
        let networkService: NetworkServiceProtocol = NetworkService()
        
        let interactor = GalleryInteractor(networkService: networkService)
        let presenter = GalleryPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        
        return vc
    }
    
    
}
