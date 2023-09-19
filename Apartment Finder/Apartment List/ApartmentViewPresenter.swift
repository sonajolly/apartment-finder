//
//  ApartmentViewPresenter.swift
//  Apartment Finder
//
//  Created by Sona Maria Jolly on 31/08/21.
//

import Foundation

protocol ApartmentViewDelegate: AnyObject {
    func getApartments(apartments: [Apartment])
}

class ApartmentViewPresenter {
    weak var delegate: ApartmentViewDelegate?
    
    // Pass something that conforms to PresenterView
    init(with delegate: ApartmentViewDelegate) {
        self.delegate = delegate
    }
    
    func fetchApartments() {
        let apartments = [
            Apartment(id: 1, name: "Brookyln Heights", address: "Poonamallee High Rd, Rajiv Nagar, Bangalore , 611098.", images: ["apartment1", "apartment2", "apartment3", "apartment4", "apartment5", "apartment6", "apartment7", "apartment8", "apartment9", "apartment10", "apartment11", "apartment12"], description: "Located in the Banashankari neighbourhood of South Bengaluru, Prestige Primose Hills is a residential community that offers a serene, high quality lifestyle which is in perfect harmony with your preferences and expectations. ", phone: "9876543210"),
            Apartment(id: 2, name: "Windsor Park", address: "Sholinganallur, Off Old Mahabalipuram Road, Chennai , 600119", images: ["apartment2", "apartment1", "apartment3", "apartment4", "apartment5", "apartment6", "apartment7", "apartment8", "apartment9", "apartment10", "apartment11", "apartment12"], description: "A home built to the highest standards with exactly your needs in mind. A rest of its kind development in Chennai, with expansive Courtyards in most of the tower, connected by a broad celebratory walk ways which are free from vehicular movements & enhance the opportunities of neighbourhood socialization. And a lavish clubhouse that presents a plethora of luxury lifestyle amenities to keep your leisure hours well occupied in camaraderie with your dear & near ones. Read & discover how you can transcend your life in a Home that answers your every need of a quality living space.", phone: "9876543210"),
            Apartment(id: 3, name: "Willow Tree", address: "Vidyaranyapura Main Rd, Vidyaranyapura, Bengaluru , 560097. ", images: ["apartment3", "apartment2", "apartment1", "apartment4", "apartment5", "apartment6", "apartment7", "apartment8", "apartment9", "apartment10", "apartment11", "apartment12"], description: "A gracefully planned elegant residential community, where you can rediscover the joy of community living.", phone: "9876543210"),
            Apartment(id: 4, name: "Nirvana", address: "Sagar Hills, Manasa Hills, Rajendranagar mandal, Hyderabad , 500030. ", images: ["apartment4", "apartment2", "apartment3", "apartment1", "apartment5", "apartment6", "apartment7", "apartment8", "apartment9", "apartment10", "apartment11", "apartment12"], description: "Welcome to a wonderful gated residential enclave of just 248 plots spread across 39 sylvan acres. Brilliantly designed, with plot sizes ranging from 267 to 2077 square yards, each fully Vaastu compliant, Prestige Nirvana promises you a life of unending ease and splendor. ", phone: "9876543210"),
            Apartment(id: 5, name: "Hillside Gateway", address: "Infopark Rd, Kalappurakkal, Kakkanad, Cochin , 682030. ", images: ["apartment5", "apartment2", "apartment3", "apartment4", "apartment1", "apartment6", "apartment7", "apartment8", "apartment9", "apartment10", "apartment11", "apartment12"], description: "At Hillside Gateway, step into a dream… a magical abode of discovery & adventure… into the world of castles and princesses.", phone: "9876543210"),
        ]
        self.delegate?.getApartments(apartments: apartments)
    }
    
}
