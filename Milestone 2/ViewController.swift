//
//  ViewController.swift
//  Milestone 2
//
//  Created by Keertiraj Laxman Malik on 22/01/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping List"
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(updateList))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Clear",style: .done, target: self, action: #selector(clearList))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "List", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
}
extension ViewController {
    
    @objc func updateList(){
        let ac = UIAlertController(title: "Enter the Item name", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else {return}
            self?.submit(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @objc func clearList(){
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    func submit(_ answer: String){
        shoppingList.insert(answer, at: 0)
        let indexPath = IndexPath(row:0, section:0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

