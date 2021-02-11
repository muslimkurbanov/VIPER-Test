//
//  GalleryPresenter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import UIKit

protocol GalleryPresenterProtocol {
    func showImages(_ completion: @escaping (_ cars: [ImagesViewModel]) -> Void)
    func showImagesDetail(for viewModel: ImagesViewModel)
}

class GalleryPresenter: GalleryPresenterProtocol {
    
    let interactor: GalleryInteractorProtocol
    let view: GalleryViewController
    let router: GalleryRouterProtocol
    
    init(interactor: GalleryInteractorProtocol, router: GalleryRouterProtocol, view: GalleryViewController) {
            self.interactor = interactor
            self.router = router
            self.view = view
        }
    
    func showImages(_ completion: @escaping (_ cars: [ImagesViewModel]) -> Void) {
        interactor.getImages { (result) in
            guard let result = result else {
                completion([])
                return
            }
            DispatchQueue.main.async {
                completion(self.createImagesViewModels(from: result))
            }
        }
    }
    
    func showImagesDetail(for viewModel: ImagesViewModel) {
    }
    
    private func createImagesViewModels(from images: [Images]) -> [ImagesViewModel] {
            return images.map({ (image) -> ImagesViewModel in
                return ImagesViewModel(urls: image.urls, description: image.description)
            })
        }
}

extension GalleryPresenter {
    
    func noticeFetchedSuccess(noticeModelArray: [ImagesViewModel]) {
    }
    
    func noticeFetchFailed() {
        print("error")
    }
}
