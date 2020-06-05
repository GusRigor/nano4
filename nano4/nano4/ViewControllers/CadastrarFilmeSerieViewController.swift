//
//  CadastrarFilmeSerieViewController.swift
//  nano4
//
//  Created by Beatriz da Silva on 28/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class CadastrarFilmeSerieViewController: UIViewController {

    @IBOutlet weak var labeltitulo: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var labelDuracao: UILabel!
    @IBOutlet weak var labelURL: UILabel!
    @IBOutlet weak var tituloTextField: UITextField!
    @IBOutlet weak var duracaoTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    
     let notificacao = Notification.Name(rawValue: "atualizarEstilo")
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observer()
        carregarPreferenciasEstilo()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
    
    func carregarPreferenciasEstilo(){
        let preferencia = UserDefaults.standard.bool(forKey: "DarkMode")
        if preferencia{
            atualizarEstilo()
        }
    }
    
    
    func atualizarEstilo(){
        if isDarkMode {
            self.view.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.labeltitulo.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelDuracao.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.img.tintColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.labelURL.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.tituloTextField.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.duracaoTextField.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.urlTextField.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.tituloTextField.backgroundColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.duracaoTextField.backgroundColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.urlTextField.backgroundColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }else{
            self.view.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.labeltitulo.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.labelDuracao.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.img.tintColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.labelURL.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.tituloTextField.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.tituloTextField.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.duracaoTextField.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.duracaoTextField.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.urlTextField.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.urlTextField.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        }
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
           tituloTextField?.resignFirstResponder()
            duracaoTextField?.resignFirstResponder()
            urlTextField?.resignFirstResponder()
        }
        func textFieldShouldClear(_ textField: UITextField) -> Bool {
            return true
        }
    
        
    @IBAction func cadastrarFilme(_ sender: Any) {
        let titulo = tituloTextField.text
        let duracao = duracaoTextField.text
        let url = urlTextField.text
            
       if titulo != nil && duracao != nil && url != nil {
            self.appDelegate.insertRecord(titulo: titulo!, duracao: Int32(duracao!)!, imgURL: url ?? " ")
            // Criar código pra limpar os campos ou segue pra levar pra tela de quantidade de horas
        }
    }
    
}
