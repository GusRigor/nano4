//
//  ViewController.swift
//  nano4
//
//  Created by Gustavo Rigor on 26/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableViewGeneric: UITableView!
    
    var dataSourceArray = [FilmSerie]()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAndUpdateTable()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmSerie = dataSourceArray[indexPath.row]
        var nomeTextField: UITextField?
        var duracaoTextField: UITextField?
        var imgURLTextField: UITextField?
        
        let mensagemDialogo = UIAlertController(title: "Adicionando Filme", message: "Atualizando o filme vc assistiu?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Atualizar", style: .default, handler: {(action) -> Void in
            let nome = nomeTextField?.text
            let duracao = duracaoTextField?.text
            let imgURL = imgURLTextField?.text
            
            if nome != nil && duracao != nil && imgURL != nil{
                self.appDelegate.updateRecord(filmSerie: filmSerie, nome: nome!, duracao: Int32(duracao!)!, imgURL: imgURL!)
                self.fetchAndUpdateTable()
            }
        })
        
        let cancel = UIAlertAction(title: "Cancelar", style: .default){ (action) -> Void in
            print("botão cancelar apertado")
        }
        
        mensagemDialogo.addAction(ok)
        mensagemDialogo.addAction(cancel)
        
        mensagemDialogo.addTextField{ (textField) -> Void in
            nomeTextField = textField
            nomeTextField?.placeholder = "Escreva o nome do filme"
            nomeTextField?.text = filmSerie.nome
        }
        mensagemDialogo.addTextField{ (textField) -> Void in
            duracaoTextField = textField
            duracaoTextField?.placeholder = "Qual a duração do filme? (minutos)"
            duracaoTextField?.text = String(filmSerie.duracao)
        }
        mensagemDialogo.addTextField{ (textField) -> Void in
            imgURLTextField = textField
            imgURLTextField?.placeholder = "Poderia adicionar a URL da capa do filme?"
            imgURLTextField?.text = filmSerie.imgURL
            
        }
        self.present(mensagemDialogo, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let filmSerie = dataSourceArray[indexPath.row]
            appDelegate.deleteRecord(filmSerie: filmSerie)
            fetchAndUpdateTable()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let filmSerie = dataSourceArray[indexPath.row]
        let aux = """
        nome: \(filmSerie.nome!)
        duração:  \(String(filmSerie.duracao))
        URL:   \(filmSerie.imgURL!)
    """
        cell?.textLabel?.text = aux
        return cell!
        
    }
    
    func fetchAndUpdateTable(){
        dataSourceArray = appDelegate.fetchRecords()
        tableViewGeneric.reloadData()
    }
    
    @IBAction func AddFilmSerie(_ sender: UIButton) {
        var nomeTextField: UITextField?
        var duracaoTextField: UITextField?
        var imgURLTextField: UITextField?
        
        let mensagemDialogo = UIAlertController(title: "Adicionando Filme", message: "Qual filme vc assistiu?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: {(action) -> Void in
            let nome = nomeTextField?.text
            let duracao = duracaoTextField?.text
            let imgURL = imgURLTextField?.text
            
            if nome != nil && duracao != nil && imgURL != nil{
                self.appDelegate.insertRecord(nome: nome!, duracao: Int32(duracao ?? "0") ?? 0, imgURL: imgURL!)
                self.fetchAndUpdateTable()
            }
        })
        
        let cancel = UIAlertAction(title: "Cancelar", style: .default){ (action) -> Void in
            print("botão cancelar apertado")
        }
        
        mensagemDialogo.addAction(ok)
        mensagemDialogo.addAction(cancel)
        
        mensagemDialogo.addTextField{ (textField) -> Void in
            nomeTextField = textField
            nomeTextField?.placeholder = "Nome do filme"
        }
        mensagemDialogo.addTextField{ (textField) -> Void in
            duracaoTextField = textField
            duracaoTextField?.placeholder = "Duracao do filme em minutos"
        }
        mensagemDialogo.addTextField{ (textField) -> Void in
            imgURLTextField = textField
            imgURLTextField?.placeholder = "URL da capa do filme"
        }
        self.present(mensagemDialogo, animated: true, completion: nil)
    }
    

}

