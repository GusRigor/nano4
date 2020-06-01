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
    
    @IBOutlet weak var horasMesTabView: UITableView!
    let meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let aux = meses[indexPath.row]
        if aux == "Maio"{
            cell?.textLabel?.text = aux
            cell?.textLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            cell?.detailTextLabel?.text = minutosToHora(Int(minutosTotais()))
            cell?.detailTextLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
            return cell!
        }
        cell?.textLabel?.text = aux
        cell?.textLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        cell?.detailTextLabel?.text = "0h 0"
        cell?.detailTextLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        return cell!
    }
    

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var TotalHoras: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaBancoDeDados()
        atualizaHorasTotais()
        
    }
    func minutosTotais() -> Int32{
        var aux:Int32 = 0
        for x in 0...(dataSourceArray.count-1){
            aux = aux + dataSourceArray[x].duracao
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
    
    
}
