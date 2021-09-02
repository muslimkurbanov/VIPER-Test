//
//  GalleryPresenter.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation

protocol GalleryPresenterProtocol {
    
    func showImages(_ completion: @escaping (_ cars: [ImagesViewModel]) -> Void)
}

final class GalleryPresenter {
    
    //MARK: - Properties
    
    private let interactor: GalleryInteractorProtocol
    private let view: GalleryScreenProtocol
    private let router: GalleryRouterProtocol
    
    //MARK: - Init
    
    init(interactor: GalleryInteractorProtocol, router: GalleryRouterProtocol, view: GalleryScreenProtocol) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    //MARK: - Functions
    
    private func createImagesViewModels(from images: [Images]) -> [ImagesViewModel] {
        return images.map({ (image) -> ImagesViewModel in
            return ImagesViewModel(urls: image.urls, description: image.description)
        })
    }
}

//MARK: - GalleryPresenterProtocol

extension GalleryPresenter: GalleryPresenterProtocol {
    
    func showImages(_ completion: @escaping (_ cars: [ImagesViewModel]) -> Void) {
        
        interactor.getImages { [weak self] (result) in
            guard let result = result else {
                completion([])
                self?.view.failure(error: "error")
                return
            }
            
            DispatchQueue.main.async {
                completion(self?.createImagesViewModels(from: result) ?? [])
                self?.view.success()
            }
        }
    }
}
