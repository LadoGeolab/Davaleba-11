//
//  ViewController.swift
//  davaleba-12
//
//  Created by Ladolado3911 on 12/8/20.
//

import UIKit




class MainViewController: UIViewController, Record {
    

    var initial_record = 0
    //var current_record: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.rcrd.text = "\(self.initial_record)"

    }
  
    @IBOutlet weak var rcrd: UILabel!
    
    @IBAction func nextbtnclicked(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameViewController") as? GameViewController else { return }
        
        //vc.record = self.initial_record
        //
        vc.record = Int(self.rcrd.text!)
        vc.recordd = self
        //vc.score = 0
        
        
        //self.present(vc, animated: true, completion: nil)
  
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func resetbtnclicked(_ sender: Any) {
        rec("0")
        
    }
    
    func rec(_ name: String) {
        rcrd.text = name
    }
    
}

