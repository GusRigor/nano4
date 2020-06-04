//
//  ConfigUsuario.swift
//  nano4
//
//  Created by Gustavo Rigor on 02/06/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit


var isDarkMode = false

class ConfigUsuario : UIViewController{
    
    @IBOutlet weak var versaoLabel: UILabel!
    @IBOutlet weak var numVersaoLabel: UILabel!
    @IBOutlet weak var imgUsuario: UIImageView!
    @IBOutlet weak var nomeUsuario: UILabel!
    @IBOutlet weak var darkmodeFrase: UILabel!
    @IBOutlet weak var darkmode: UISwitch!
    @IBOutlet weak var filmsLabel: UILabel!
    @IBOutlet weak var numFilmes: UILabel!
    
    let notificacao = Notification.Name(rawValue: "atualizarNome")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregarPreferenciasEstilo()
        numFilmesAssistidos()
        carregarNome()
        observer()
    }
    
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizaNome(notificacao:)), name: notificacao, object: nil)
    }
    @objc func atualizaNome(notificacao: NSNotification){
        print("a notificacao chegou")
        carregarNome()
    }
    
    
    func atualizarEstilo(){
        
        UIView.animate(withDuration: 0.4){
            if isDarkMode {
                self.view.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                self.versaoLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.numVersaoLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.imgUsuario.tintColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.nomeUsuario.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.darkmodeFrase.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.filmsLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.numFilmes.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            }else{
                self.view.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                self.versaoLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.numVersaoLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.imgUsuario.tintColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
                self.nomeUsuario.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.darkmodeFrase.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.filmsLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.numFilmes.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
                self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            }
        }
    }
    func atualizarEstilo1(){
        if isDarkMode {
            self.view.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.versaoLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.numVersaoLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.imgUsuario.tintColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.nomeUsuario.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.darkmodeFrase.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.filmsLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.numFilmes.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }else{
            self.view.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.versaoLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.numVersaoLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.imgUsuario.tintColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.nomeUsuario.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.darkmodeFrase.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.filmsLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.numFilmes.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.tabBarController?.tabBar.backgroundColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        }
    }
    
    @IBAction func darkmodeSelecionado(_ sender: UISwitch) {
        //print(isDarkMode)
        if isDarkMode {
            isDarkMode = false
        }else{
            isDarkMode = true
        }
        //print(isDarkMode)
        atualizarEstilo()
        salvarPreferenciaEstilo()
        NotificationCenter.default.post(name: NSNotification.Name.init("atualizarEstilo"), object: nil)
    }
    
    func numFilmesAssistidos(){
        numFilmes.text = String(dataSourceArray.count)
    }
    
    func salvarPreferenciaEstilo(){
        UserDefaults.standard.set(isDarkMode, forKey: "DarkMode")
    }
    
    func carregarNome(){
        let nome = UserDefaults.standard.object(forKey: "NomeUsuario") as? String
        nomeUsuario.text = nome
    }
    
    func carregarPreferenciasEstilo(){
       let preferencia = UserDefaults.standard.bool(forKey: "DarkMode")
        if preferencia{
            isDarkMode = true
            atualizarEstilo1()
            self.darkmode.isOn = true
        }
    }
}
