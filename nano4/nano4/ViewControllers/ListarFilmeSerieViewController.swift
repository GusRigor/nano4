//
//  ListarFilmeSerieViewController.swift
//  nano4
//
//  Created by Beatriz da Silva on 28/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//

import UIKit

class ListarFilmeSerieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var listaFilmeSerie: UITableView!
    
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
        
           
           let mensagemDialogo = UIAlertController(title: "Atualizando o Filme", message: "Atualizando o filme vc assistiu?", preferredStyle: .alert)
           
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
    
    //Está funcão está olhando no array de dados quantas celulas precisa instanciar
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        let filmSerie = dataSourceArray[indexPath.row]
        let aux = "\(filmSerie.nome!)"
        cell?.textLabel?.text = aux
        cell?.textLabel?.textColor = .some(#colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1))
        return cell!
        
    }
    
    func fetchAndUpdateTable(){
        dataSourceArray = appDelegate.fetchRecords()
        listaFilmeSerie.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
