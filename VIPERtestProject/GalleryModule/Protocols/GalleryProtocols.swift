//
//  GalleryProtocols.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingNotice()
    func showMovieController(navigationController:UINavigationController)

}

protocol PresenterToViewProtocol: class{
    func applyData(model: [Images])
    func failure(error: Error)

    func showNotice(noticeArray: [Images])
//    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule()-> GalleryViewController
}

protocol PresenterToInteractorProtocol: class {
    var presenter:InteractorToPresenterProtocol? {get set}
    func fetchNotice(completion: @escaping (Result<[Images]?, Error>) -> Void)
}

protocol InteractorToPresenterProtocol: class {
    func noticeFetchedSuccess(noticeModelArray: [Images])
    func noticeFetchFailed()
}
