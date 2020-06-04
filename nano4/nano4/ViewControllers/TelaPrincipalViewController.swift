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
            nomeTextField.isHidden = false
        }
        carregarInicial()
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
            toqueParaComeçar.isHidden = true
            comecarButton.isHidden = true
            nomeTextField.isHidden = true
        }else{
            inidicacaoIniciar.isHidden = true
            toqueParaComeçar.isHidden = true
            comecarButton.isHidden = true
            nomeTextField.isHidden = false
        }
    }

    
    
}
