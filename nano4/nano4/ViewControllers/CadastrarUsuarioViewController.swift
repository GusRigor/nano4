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
        observer()
    
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(mostraTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(escondeTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func mostraTeclado(notificacao: NSNotification){
               if let keyboardSize = (notificacao.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
                   if let duracao = notificacao.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double {

                       UIView.animate(withDuration: duracao){
                           let limites = UIScreen.main.bounds
                           self.view.frame = CGRect(x: limites.origin.x, y: limites.origin.y, width: limites.width, height: limites.height - keyboardSize.height)
                           self.view.layoutIfNeeded()
                       }
                   }
               }
           }

           @objc func escondeTeclado(notificacao: NSNotification){
               if let duracao = notificacao.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double {
                   UIView.animate(withDuration: duracao){
                       self.view.frame = UIScreen.main.bounds
                       self.view.layoutIfNeeded()
                   }
               }
           }

           override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
              nomeTextField?.resignFirstResponder()
           }
           func textFieldShouldClear(_ textField: UITextField) -> Bool {
               return true
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
