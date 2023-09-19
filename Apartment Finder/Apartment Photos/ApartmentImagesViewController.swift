//
//  ApartmentImagesViewController.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 01/09/21.
//

import UIKit

class ApartmentImagesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var btnList: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    var isListView: Bool = false
    var images: [String] = []
    
    private lazy var listLayout: UICollectionViewFlowLayout = {

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 0, right: 6)
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 12, height: 240)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 6
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()

    private lazy var gridLayout: UICollectionViewFlowLayout = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 0, right: 6)
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 18) / 2 , height: UIScreen.main.bounds.height*0.16)
        flowLayout.minimumInteritemSpacing = 6
        flowLayout.minimumLineSpacing = 6
        return flowLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.collectionViewLayout = self.isListView ? self.listLayout : self.gridLayout
    }

    //MARK:- Button IBActions
    @IBAction func btnListTapped(_ sender: Any) {
        self.isListView = !self.isListView
        self.btnList.image = UIImage.init(systemName: self.isListView ? "list.bullet" : "square.grid.2x2.fill")
    //self.collectionView.startInteractiveTransition(to: self.isListView ? self.listLayout : self.gridLayout, completion: nil)
        collectionView.startInteractiveTransition(to: self.isListView ? self.listLayout : self.gridLayout) { _, _ in
            self.collectionView.setContentOffset(.zero, animated: true)
        }
        self.collectionView.finishInteractiveTransition()

    }
    
    //MARK:- Collection view delegates and data sources
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApartmentImagesCollectionViewCell", for: indexPath) as? ApartmentImagesCollectionViewCell {
            cell.imageView.image = UIImage(named: self.images[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let photoExpandVC = storyboard.instantiateViewController(identifier: "PhotoExpandViewController") as! PhotoExpandViewController
        photoExpandVC.image = self.images[indexPath.row]
        self.navigationController?.present(photoExpandVC, animated: true, completion: nil)
    }
    
}
