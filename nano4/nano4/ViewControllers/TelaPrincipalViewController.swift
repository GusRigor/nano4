//
//  TelaPrincipalViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 03/06/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit

class TelaPrincipal : UIViewController{
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var inidicacaoIniciar: UILabel!
    @IBOutlet weak var comecarButton: UIButton!
    @IBOutlet weak var toqueParaComeçar: UIButton!
    
    var taSalvo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.taSalvo{
            inidicacaoIniciar.isHidden = false
        }else{
            comecarButton.isHidden = false
            nomeTextField.isHidden = false
        }
        carregarInicial()
        print(taSalvo)
    }
    
    func salvarPrimeiraEntrada(){
        UserDefaults.standard.set(self.taSalvo, forKey: "taSalvo")
    }
    
    @IBAction func comecarESalvar(_ sender: Any) {
        self.taSalvo = true
        salvarPrimeiraEntrada()
        if nomeTextField.text != nil{
            UserDefaults.standard.set(nomeTextField.text, forKey: "NomeUsuario")
        }
    }
    
    func carregarInicial(){
        let salvo = UserDefaults.standard.bool(forKey: "taSalvo")
        if salvo{
            inidicacaoIniciar.isHidden = false
            toqueParaComeçar.isHidden = false
            comecarButton.isHidden = true
            nomeTextField.isHidden = true
        }else{
            inidicacaoIniciar.isHidden = true
            toqueParaComeçar.isHidden = true
            comecarButton.isHidden = false
            nomeTextField.isHidden = false
        }
    }

    
    
}
