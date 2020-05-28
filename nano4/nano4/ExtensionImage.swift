//
//  ExtensionImage.swift
//  nano4
//
//  Created by Gustavo Rigor on 27/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit

//Este cara aqui é para adicionarmos a imagem do filme a partir da internet
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
