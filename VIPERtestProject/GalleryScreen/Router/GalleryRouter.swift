//
//  GalleryRouter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import UIKit

protocol GalleryRouterProtocol {
    static func showGallery() -> GalleryScreenVC?
}

final class GalleryRouter: GalleryRouterProtocol {
    
    //MARK: - Properties
    
    private let presentingViewController: UIViewController
    
    //MARK: - Init
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    //MARK: - Functions
    
    static func showGallery() -> GalleryScreenVC? {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyViewController") as! GalleryScreenVC
        let router = GalleryRouter(presentingViewController: vc)
        let networkService: NetworkServiceProtocol = NetworkService()
        
        let interactor = GalleryInteractor(networkService: networkService)
        let presenter = GalleryPresenter(interactor: interactor, router: router, view: vc)
        vc.presenter = presenter
        
        return vc
    }
    
    
}
