//
//  ViewController.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.02.2021.
//

import UIKit

class GoToGalleryViewController: UIViewController {
    
    @IBAction func goToGallery(_ sender: Any) {
        guard let gallery = GalleryRouter.showGallery() else { return }
        navigationController?.pushViewController(gallery, animated: true)
    }
}
