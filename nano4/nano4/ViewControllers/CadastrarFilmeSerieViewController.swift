//
//  CadastrarFilmeSerieViewController.swift
//  nano4
//
//  Created by Beatriz da Silva on 28/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class CadastrarFilmeSerieViewController: UIViewController {

    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var duracaoTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
        
    @IBAction func cadastrarFilme(_ sender: Any) {
        let titulo = tituloTextField.text
        let duracao = duracaoTextField.text
        let url = urlTextField.text
            
//        if titulo != nil && duracao != nil {
//            self.appDelegate.insertRecord(titulo: titulo!, duracao: duracao!, imgURL: url!)
//            self.fetchAndUpdateTable()
//        }
    }
    
}
