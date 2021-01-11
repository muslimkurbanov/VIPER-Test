//
//  GalleryRouter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import UIKit

class GalleryRouter: PresenterToRouterProtocol{

    
    static func createModule() -> GalleryViewController {
        
        let view = mainstoryboard.instantiateViewController(withIdentifier: "MyViewController") as! GalleryViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = GalleryPresenter()
        let interactor: PresenterToInteractorProtocol = GalleryInteractor()
        let router:PresenterToRouterProtocol = GalleryRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
//    func pushToMovieScreen(navigationConroller navigationController:UINavigationController) {
//
//        let movieModue = MovieRouter.createMovieModule()
//        navigationController.pushViewController(movieModue,animated: true)
//
//    }
    
}
