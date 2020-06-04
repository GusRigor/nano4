//
//  CadastrarFilmeSerieViewController.swift
//  nano4
//
//  Created by Beatriz da Silva on 28/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class CadastrarFilmeSerieViewController: UIViewController {

<<<<<<< Updated upstream
=======
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var duracaoTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
>>>>>>> Stashed changes
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
<<<<<<< Updated upstream
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

=======
        
    @IBAction func cadastrarFilme(_ sender: Any) {
        let titulo = tituloTextField.text
        let duracao = duracaoTextField.text
        let url = urlTextField.text
            
        if titulo != nil && duracao != nil {
            self.appDelegate.insertRecord(nome: titulo!, duracao: Int32(duracao!)!, imgURL: url ?? "")

        }
    }
>>>>>>> Stashed changes
}
