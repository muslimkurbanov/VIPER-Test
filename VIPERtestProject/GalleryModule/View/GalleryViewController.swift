//
//  ViewController.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.01.2021.
//

import UIKit
import SDWebImage

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    
    var presenter: GalleryPresenterProtocol?
    var viewModels: [ImagesViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .blue
        self.title = "Галлерея"
        
        presenter?.showImages { (viewModels) in
            self.viewModels = viewModels
            self.collectionView.reloadData()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let viewModel = viewModels[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: viewModel.urls["small"] ?? ""), completed: nil)
        cell.label.text = viewModel.description ?? "No name"
        return cell
    }
}

extension GalleryViewController {
    
    func success() {
        activityIndicator.stopAnimating()
    }
    func showNotice(noticeArray: [Images]) {
        self.collectionView.reloadData()
    }
    
//    func showNotice(noticeArray: Array<Images>) {
//
//    }
//
//    func showError() {
//        
//    }
    
    func applyData(model: [Images]) {
//        searchResponse.append(contentsOf: model)

    }
    
    func failure(error: Error) {
        print("error")

    }
}
    
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
}
