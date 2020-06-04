//
//  AlterarNomeViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 04/06/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit

class AlterarNomeViewController: UIViewController{
    
    @IBOutlet weak var labelQual: UILabel!
    @IBOutlet weak var labelSera: UILabel!
    @IBOutlet weak var labelSeuNovo: UILabel!
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelPonto: UILabel!
    
    @IBOutlet weak var novoNomeTextField: UITextField!
    
    let notificacao = Notification.Name(rawValue: "atualizarEstilo")
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregarPreferenciasEstilo()
    }
    
    func observer(){
         NotificationCenter.default.addObserver(self, selector: #selector(mostraTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(escondeTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizaTelaEstilo(notificacao:)), name: notificacao, object: nil)
     }
    
    @objc func atualizaTelaEstilo(notificacao: NSNotification){
        print("a notificacao chegou")
        atualizarEstilo()
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
         novoNomeTextField?.resignFirstResponder()
     }
     func textFieldShouldClear(_ textField: UITextField) -> Bool {
         return true
     }
    
    @IBAction func modificarNome(_ sender: Any) {
        let novoNome = novoNomeTextField.text
        if novoNome != nil && novoNome != " "{
            UserDefaults.standard.set(novoNome, forKey: "NomeUsuario")
            NotificationCenter.default.post(name: NSNotification.Name.init("atualizarNome"), object: nil)
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    @IBAction func fecharTela(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func atualizarEstilo(){
        if isDarkMode{
            self.view.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.labelQual.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelSera.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelSeuNovo.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelNome.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelPonto.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.novoNomeTextField.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        }else{
            self.view.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.labelQual.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.labelSera.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.labelSeuNovo.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.labelNome.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.labelPonto.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.novoNomeTextField.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        }
    }
    
    func carregarPreferenciasEstilo(){
           let preferencia = UserDefaults.standard.bool(forKey: "DarkMode")
           if preferencia{
               atualizarEstilo()
           }
       }
}
