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
    
    var presenter: ViewToPresenterProtocol?
    
//    var noticeArrayList: [Images] = []
    
//    var noticeArrayList:Array<Images> = Array()

    var searchResponse = [Images]() {
        didSet {
//            galleryCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .blue
        self.title = "Gallery"
        presenter?.startFetchingNotice()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .blue
        print(searchResponse.count)
    }


}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResponse.count
//        return 10
//        return noticeArrayList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
//        let item = noticeArrayList[indexPath.row]
        let item = searchResponse[indexPath.row]
////        cell.confingurate(with: item)
        cell.imageView.sd_setImage(with: URL(string: item.urls["small"] ?? ""), completed: nil)
        cell.label.text = item.description
        cell.backgroundColor = .red
        return cell
    }
    
    
}

extension GalleryViewController: PresenterToViewProtocol {
    func showNotice(noticeArray: [Images]) {
        self.searchResponse = noticeArray
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
        searchResponse.append(contentsOf: model)

    }
    
    func failure(error: Error) {
        print("error")

    }
    
    
}
    
class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
}
