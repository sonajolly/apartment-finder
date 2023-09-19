//
//  ApartmentDetailViewController.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 01/09/21.
//

import UIKit

class ApartmentDetailViewController: UIViewController {

    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var btnApartmentImg: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var addressLbl: UILabel!
    
    var apartment: Apartment?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
    }
    
    func initializeView() {
        if let flat = self.apartment {
            self.title = flat.name
            self.btnApartmentImg.setBackgroundImage(UIImage(named: flat.images[0]), for: .normal)
            self.nameLbl.text = flat.name
            self.addressLbl.text = flat.address
            self.btnPhone.setTitle("+91-\(flat.phone)", for: .normal)
            self.descriptionLbl.text = flat.description
            self.typeLbl.text = flat.type
        }
    }
    
    //MARK:- Button Actions
    @IBAction func btnPhoneTapped(_ sender: Any) {
        if let phone = self.apartment?.phone,
           let url = URL(string: "tel://\(phone)"),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }

    @IBAction func btnImageTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let imageDetailVC = storyboard.instantiateViewController(identifier: "ApartmentImagesViewController") as! ApartmentImagesViewController
        imageDetailVC.images = self.apartment?.images ?? []
        self.navigationController?.pushViewController(imageDetailVC, animated: true)
    }

}
