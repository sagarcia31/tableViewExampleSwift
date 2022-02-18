//
//  ViewController.swift
//  tableViewExample
//
//  Created by Marcelo Garcia on 17/02/22.
//

import UIKit

struct Pet {
    let name: String
    let imagePath: String
}

class ViewController: UIViewController {
//    let nameOfPets = [Pet(name: "Tuti", imagePath: "tuti"),
//                      Pet(name: "Pepeta", imagePath: "pepeta"),
//                      Pet(name: "Chiquinha", imagePath: "chiquinha"),
//                      Pet(name: "Misty", imagePath: "misty")]
    
    let nameOfPets = ["Tuti", "Pepeta", "Chiquinha", "Misty"]
    var nameSelected: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Registrar a customCell na nossa tableView
        let nib = UINib(nibName: "PetsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PetsTableViewCell")
    }
    
    fileprivate func selectImages(_ indexPath: IndexPath, _ cell: PetsTableViewCell) {
        if(nameOfPets[indexPath.row] == "Tuti") {
            cell.imageCat.image = UIImage(named: "tuti")
            cell.labelCat.text = "Tuti"
            cell.viewCat.backgroundColor = UIColor.gray
        } else if (nameOfPets[indexPath.row] == "Pepeta") {
            cell.imageCat.image = UIImage(named: "pepeta")
            cell.labelCat.text = "Pepeta"
            cell.viewCat.backgroundColor = UIColor.black
        } else if (nameOfPets[indexPath.row] == "Chiquinha") {
            cell.imageCat.image = UIImage(named: "chiquinha")
            cell.labelCat.text = "Chiquinha"
            cell.viewCat.backgroundColor = UIColor.blue
        } else {
            cell.imageCat.image = UIImage(named: "misty")
            cell.labelCat.text = "Misty"
            cell.viewCat.backgroundColor = UIColor.yellow
        }
    }
}

extension ViewController: UITableViewDataSource {
    // Quantos elementos eu vou ter na minha tabela
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfPets.count
    }
    
    // Popular a minha cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PetsTableViewCell", for: indexPath) as! PetsTableViewCell
        selectImages(indexPath, cell)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        nameSelected = nameOfPets[indexPath.row]
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
        performSegue(withIdentifier: "detailCatSegue", sender: self)
    }
    
    // Tamanho da tableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    // Passando por parametro os valores
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailCatSegue") {
            let vc = segue.destination as? DetailViewController
            vc?.nameOfCat = nameSelected!
        }
    }
}





