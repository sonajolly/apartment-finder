//
//  ApartmentViewController.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 31/08/21.
//

import UIKit

class ApartmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var apartmentTableView: UITableView!
    lazy var apartmentPresenter = ApartmentViewPresenter(with: self)
    var apartments: [Apartment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.apartmentPresenter.fetchApartments()
    }
    
    //MARK:- TableView Delegate & TableView Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apartments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentTableViewCell", for: indexPath) as? ApartmentTableViewCell {
            cell.configureCell(self.apartments[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyBoard.instantiateViewController(withIdentifier: "ApartmentDetailViewController") as! ApartmentDetailViewController
        detailViewController.apartment = self.apartments[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK:- Delegate: Fetch Apartments
extension ApartmentViewController: ApartmentViewDelegate {
    func getApartments(apartments: [Apartment]) {
        self.apartments = apartments
        self.apartmentTableView.reloadData()
    }
}
