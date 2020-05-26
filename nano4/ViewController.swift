//
//  ViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 23/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

let gatoDeChapeu = "https://i0.wp.com/www.hillsides.com.br/wp-content/uploads/2020/04/Gomaomi-animal-de-estimao-cachorro-gato-traje-cowboy-jeans-camisas-com-capuz-halloween-traje-macaco-32698217019-6334-600x600-1.jpg"

class ViewController: UIViewController {

    @IBOutlet weak var imageURLtest: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
    }
    
    func updateImage(){
        let urlImage = URL(string: gatoDeChapeu)!
        imageURLtest.load(url: urlImage)
    }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

