//
//  ApartmentTableViewCell.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 31/08/21.
//

import UIKit

class ApartmentTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.layer.cornerRadius = 10.0
    }
    
    func configureCell(_ apartment: Apartment) {
        self.titleLbl.text = apartment.name
        self.addressLbl.text = apartment.address
        self.imgView.image = UIImage(named: apartment.images[0])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
