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
       
    }
    
    @objc func clearList(){
       
    }
    
   
}

