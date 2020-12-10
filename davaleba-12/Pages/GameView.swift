//
//  GameView.swift
//  davaleba-12
//
//  Created by Ladolado3911 on 12/8/20.
//

import UIKit
import Foundation

protocol Record {
    func rec(_ name: String)
}


class GameViewController: UIViewController {
    
    var recordd: Record?
    
    var timer_seconds = Timer()
    var timer_miliseconds = Timer()
    
    var timerdisplayed1 = 30
    
    var score = 0
    var record: Int?
    
    var correct: Int = 0

    
    @IBOutlet weak var second: UILabel!
    
    @IBOutlet weak var tst: UILabel!
    
    @objc func seconds() {
        
        var score_final = Int(self.scorre.text!)!
        
        timerdisplayed1 -= 1
        second.text = "\(timerdisplayed1)"
        

        if (timerdisplayed1 == 0) {
            if (score > self.record!) {
                recordd?.rec("\(score)")
            } else {
                recordd?.rec("\(self.record!)")
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        correct = changeThings()

        // Do any additional setup after loading the view.
    }
    
    func startTimer() {
                
        timer_seconds = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(seconds), userInfo: nil, repeats: true)

    }
    
    @IBOutlet weak var num1: UILabel!
    @IBOutlet weak var num2: UILabel!
    @IBOutlet weak var ope: UILabel!
    
    @IBOutlet weak var scorre: UILabel!
    @IBOutlet weak var sc_txt: UILabel!
    @IBOutlet weak var time_txt: UILabel!
    @IBOutlet weak var tm_txt: UILabel!
    
    @IBOutlet weak var outopt1: UIButton!
    @IBOutlet weak var outopt2: UIButton!
    @IBOutlet weak var outopt3: UIButton!
    @IBOutlet weak var outopt4: UIButton!
    
    func animation(_ inp: String, _ color: UIColor) {
        self.num1.textColor = color
        self.num2.textColor = color
        self.ope.textColor = color
        self.scorre.textColor = color
        self.sc_txt.textColor = color
        self.time_txt.textColor = color
        self.tm_txt.textColor = color
        
        self.outopt1.setTitleColor(color, for: .normal)
        self.outopt2.setTitleColor(color, for: .normal)
        self.outopt3.setTitleColor(color, for: .normal)
        self.outopt4.setTitleColor(color, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
            self.num1.textColor = UIColor.black
            self.num2.textColor = UIColor.black
            self.ope.textColor = UIColor.black
            self.scorre.textColor = UIColor.black
            self.sc_txt.textColor = UIColor.black
            self.time_txt.textColor = UIColor.black
            self.tm_txt.textColor = UIColor.black
            
            self.outopt1.setTitleColor(UIColor.black, for: .normal)
            self.outopt2.setTitleColor(UIColor.black, for: .normal)
            self.outopt3.setTitleColor(UIColor.black, for: .normal)
            self.outopt4.setTitleColor(UIColor.black, for: .normal)
        }
    }
    
    
    func test(name test1: UIButton, _ correct: Int) {
        
        let test = Int(test1.currentTitle!)
        //corr.text = "\(test!)"
        
        if (Int(test!) == correct) {
            score += 1
            scorre.text = "\(score)"
            
            animation("+1", UIColor.green)
    
            }
    
         else {
            score -= 1
            scorre.text = "\(score)"
            
            animation("-1", UIColor.red)

        }
        
    }
    
    @IBAction func opt1(_ sender: Any) {
        test(name: outopt1, correct)
        correct = changeThings()
    }
    
    @IBAction func opt2(_ sender: Any) {
        test(name: outopt2, correct)
        correct = changeThings()
    }
    
    @IBAction func opt3(_ sender: Any) {
        test(name: outopt3, correct)
        correct = changeThings()
    }
    
    @IBAction func opt4(_ sender: Any) {
        test(name: outopt4, correct)
        correct = changeThings()
    }

    
    
    func getInfo() -> [Any] {
        
        
        var info = [Any]()
        let operators = ["x", "+", "-"]
        
        let randomInt1 = Int.random(in: 1..<20)
        //num1.text = "\(randomInt1)"
        info.append(randomInt1)
        
        let randomInt2 = Int.random(in: 1..<20)
        //num2.text = "\(randomInt2)"
        info.append(randomInt2)

        let randomOpe = operators.randomElement()
        //ope.text = randomOpe
        info.append(randomOpe!)
        
        var correct: Int
        
        if (randomOpe == "x") {
            correct = randomInt1 * randomInt2
            
        } else if (randomOpe == "+") {
            correct = randomInt1 + randomInt2
            
        } else {
            correct = randomInt1 - randomInt2
        }
        
        var incorrects = [Int]()
        
        while (true) {
        
            var test_arr = [Int]()
                
            for _ in 0...3 {
                let incorrect = Int.random(in: -19..<40)
                
                if (incorrect == correct) {
                    continue
                }
                
                test_arr.append(incorrect)
            }

            if (Array(Set(test_arr)).count == 4) {
                incorrects = test_arr
                break
            }
        }
        
        let incorrect1 = incorrects[0]
        let incorrect2 = incorrects[1]
        let incorrect3 = incorrects[2]
        
        
        let answers = [correct, incorrect1, incorrect2, incorrect3]
        
        let changed_answers = answers.shuffled()

    
        info.append(answers)
        info.append(changed_answers)
        info.append(correct)

        
        return info

    }
    
    func changeThings() -> Int {
        
        let info = getInfo()
        
        num1.text = "\(info[0])"
        num2.text = "\(info[1])"
        ope.text = "\(info[2])"
        
        let buttons = [
            outopt1,
            outopt2,
            outopt3,
            outopt4
        ]
        
        let changed_answers = info[4] as? [Int]
        
        for a in 0...3 {
            buttons[a]!.setTitle("\(changed_answers![a])", for: .normal)
        }
        
        let correct = info[5] as! Int
        
        return correct
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.recordd!.rec("\(score)")
        
    }
    
    
}
