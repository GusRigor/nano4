//
//  CadastrarUsuarioViewController.swift
//  nano4
//
//  Created by Beatriz da Silva on 04/06/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class CadastrarUsuarioViewController: UIViewController {
    @IBOutlet weak var nomeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Busca no UserDefaults o que estiver salvo na forkey nomeUsuario e coloca na constante nome
        let nome = UserDefaults.standard.string(forKey: "nomeUsuario")
        
        // Se tiver algo em nome vai pra tela principal
        if nome != nil {
            let tabBarController = UIStoryboard(name: "TelaPrincipal", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            UIApplication.shared.windows[0].rootViewController = tabBarController
        }else{

        }
    }
    
    @IBAction func salvarNomeUsuario(_ sender: Any) {
        // Se tiver algo digitado no textField salva isso no UserDefaults com a forkey nomeUsuario
        if nomeTextField.text != nil{
            UserDefaults.standard.set(nomeTextField.text, forKey: "nomeUsuario")
        }
    }

}
