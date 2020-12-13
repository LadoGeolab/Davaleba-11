//
//  ViewController.swift
//  davaleba-13
//
//  Created by Ladolado3911 on 12/12/20.
//

import UIKit

class FirstPage: UIViewController {
    
    var database = [String]()
        
    @IBOutlet weak var table1: UITableView!
    @IBOutlet weak var add: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table1.dataSource = self
        table1.delegate = self
        
        
    }
    
    
    @IBAction func btt(_ sender: Any) {
        
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondPage") as? SecondPage
        
        vc2?.delegate = self
        
        
        self.present(vc2!, animated: true, completion: nil)
    }
    

}

extension FirstPage: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.database.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table1.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "\(database[indexPath.row])"
          
        return cell
    }

}

extension FirstPage: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        

    }
}

extension FirstPage: AddThing {
    func addthing(_ str: String) {
        self.dismiss(animated: true) {
            self.database.append(str)
            self.table1.reloadData()
        }

    }
}

