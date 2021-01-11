//
//  GalleryPresenter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import UIKit

class GalleryPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    private var searchResponce: [Images]? = nil

    
    func startFetchingNotice() {
        interactor?.fetchNotice { [weak self] (result) in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let searchResponce):
                    self.searchResponce = searchResponce
                    self.view?.applyData(model: searchResponce!)
                    print(searchResponce)
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func showMovieController(navigationController: UINavigationController) {
    }

}

extension GalleryPresenter: InteractorToPresenterProtocol{
    
    func noticeFetchedSuccess(noticeModelArray: [Images]) {
        view?.applyData(model: noticeModelArray)
    }
    
    func noticeFetchFailed() {
        print("error")
    }
    
    
}
