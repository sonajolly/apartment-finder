//
//  PhotoExpandViewController.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 01/09/21.
//

import UIKit

class PhotoExpandViewController: UIViewController {

    @IBOutlet weak var apartmentImgView: UIImageView!
    var image: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let photo = self.image {
            self.apartmentImgView.image = UIImage(named: photo)
        }
    }

    //MARK:- Dismiss view
    @IBAction func btnCancelTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
