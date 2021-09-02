//
//  GalleryViewScreen.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import UIKit
import SDWebImage

protocol GalleryScreenProtocol {
    
    func success()
    func failure(error: String)
}

final class GalleryScreenVC: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - Properties
    
    var presenter: GalleryPresenterProtocol?
    var viewModels: [ImagesViewModel] = []
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Галлерея"
        
        presenter?.showImages { [weak self] (viewModels) in
            
            self?.viewModels = viewModels
            self?.collectionView.reloadData()
        }
        
        collectionView.dataSource = self
    }
}

//MARK: - UICollectionViewDataSource

extension GalleryScreenVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let viewModel = viewModels[indexPath.row]
        
        cell.configurate(with: viewModel)
        return cell
    }
}

//MARK: - GalleryScreenProtocol

extension GalleryScreenVC: GalleryScreenProtocol {
    
    func success() {
        activityIndicator.stopAnimating()
    }
    
    func failure(error: String) {
        print("error")
    }
}
