//
//  GoToGalleryScreenVC.swift
//  VIPERtestProject
//
//  Created by Муслим Курбанов on 11.02.2021.
//

import UIKit

final class GoToGalleryScreenVC: UIViewController {
    
    //MARK: - IBActions
    
    @IBAction private func goToGallery(_ sender: Any) {
        
        DispatchQueue.main.async {
            
            guard let gallery = GalleryRouter.showGallery() else { return }
            self.navigationController?.pushViewController(gallery, animated: true)
        }
    }
}
