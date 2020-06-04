//
//  PrincipalViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 29/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit


class Principal: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var imgRelogio: UIImageView!
    @IBOutlet weak var telaPrincipalLabel: UILabel!
    @IBOutlet weak var horasMesTabView: UITableView!
    @IBOutlet weak var TotalHoras: UILabel!
    
    let notificacao = Notification.Name(rawValue: "atualizarEstilo")
    
    let meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizaTelaEstilo(notificacao:)), name: notificacao, object: nil)
    }
    @objc func atualizaTelaEstilo(notificacao: NSNotification){
        print("a notificacao chegou")
        atualizarEstilo()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let aux = meses[indexPath.row]
        
        if isDarkMode{
            cell?.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            cell?.textLabel?.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            cell?.detailTextLabel?.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        }else{
            cell?.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            cell?.textLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            cell?.detailTextLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        }
        
        
        if aux == "Maio"{
            cell?.textLabel?.text = aux
            cell?.detailTextLabel?.text = minutosToHora(Int(minutosTotais()))
            return cell!
        }
        cell?.textLabel?.text = aux
        cell?.detailTextLabel?.text = "0h 0"
        return cell!
    }
    

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observer()
        carregaBancoDeDados()
        atualizaHorasTotais()
        carregarPreferenciasEstilo()
        print(UserDefaults.standard.bool(forKey: "taSalvo"))
        print(UserDefaults.standard.object(forKey: "NomeUsuario") ?? " ")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        atualizarTabela()
        carregarPreferenciasEstilo()
    }
    
    func minutosTotais() -> Int32{
        var aux:Int32 = 0
        if dataSourceArray.count != 0 {
            for x in 0...(dataSourceArray.count-1){
                aux = aux + dataSourceArray[x].duracao
            }
        }
        return aux
    }

    func minutosToHora(_ x : Int) -> String {
        if x < 60 {
            return "0h \(x)"
        }
        return "\(x/60)h \(x%60)"
    }
    
    func carregaBancoDeDados(){
        dataSourceArray = appDelegate.fetchRecords()
        print("Minutos totais: \(minutosTotais())")
    }
    
    func atualizaHorasTotais(){
        TotalHoras.text = minutosToHora(Int(minutosTotais()))
    }
    
    func atualizarEstilo(){
        if isDarkMode{
            self.view.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.imgRelogio.tintColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.TotalHoras.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.telaPrincipalLabel.textColor = .some(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            self.horasMesTabView.backgroundColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        }else{
            self.view.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
            self.imgRelogio.tintColor = .some(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
            self.TotalHoras.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.telaPrincipalLabel.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            self.horasMesTabView.backgroundColor = .some(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
        }
        atualizarTabela()
        
    }
    
    func carregarPreferenciasEstilo(){
           let preferencia = UserDefaults.standard.bool(forKey: "DarkMode")
           if preferencia{
               isDarkMode = true
               atualizarEstilo()
           }
       }
    
    func atualizarTabela(){
        horasMesTabView.reloadData()
    }
    
}
