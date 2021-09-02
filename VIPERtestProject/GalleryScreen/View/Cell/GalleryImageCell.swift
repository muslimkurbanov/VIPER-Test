//
//  GalleryImageCell.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 02.09.2021.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageNameLabel: UILabel!
    
    func configurate(with model: ImagesViewModel) {
        
        imageView.sd_setImage(with: URL(string: model.urls["small"] ?? ""), completed: nil)
        imageNameLabel.text = model.description ?? "No name"
    }
}
