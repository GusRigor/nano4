//
//  PrincipalViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 29/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import Foundation
import UIKit


class Principal: UIViewController{

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
