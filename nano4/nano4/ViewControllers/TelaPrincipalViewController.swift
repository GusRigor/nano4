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
    @IBOutlet weak var comecarButton: UIButton!
    
    @IBOutlet weak var inidicacaoIniciar: UILabel!
    @IBOutlet weak var toqueParaComeçar: UIButton!
    
    var taSalvo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pega os dados salvos em UserDefaults com a chave "taSalvo"
        let salvo = UserDefaults.standard.bool(forKey: "nomeUsuario")
        
        // Caso tenha algo salvo segue pra tela principal do app
        if salvo{
            performSegue(withIdentifier: "novoCadastro", sender: self)
        }else{

        }
        
        print(taSalvo)
        observer()
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
         comecarButton.isHidden =  false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nomeTextField?.resignFirstResponder()
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    @IBAction func salvarNomeUsuario(_ sender: Any) {
        if nomeTextField.text != nil{
            UserDefaults.standard.set(nomeTextField.text, forKey: "nomeUsuario")
        }
    }
    
}
