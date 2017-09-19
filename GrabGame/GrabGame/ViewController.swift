//
//  ViewController.swift
//  GrabGame
//
//  Created by Murat Has on 19.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countTV: UILabel!
    @IBOutlet weak var scoreTV: UILabel!
    
    @IBOutlet weak var spy1: UIImageView!
    @IBOutlet weak var spy2: UIImageView!
    @IBOutlet weak var spy3: UIImageView!
    @IBOutlet weak var spy4: UIImageView!
    @IBOutlet weak var spy5: UIImageView!
    @IBOutlet weak var spy6: UIImageView!
    @IBOutlet weak var spy7: UIImageView!
    @IBOutlet weak var spy8: UIImageView!
    @IBOutlet weak var spy9: UIImageView!
    
    var count = 10
    var score = 0;
    var timer = Timer()
    var levelTimer = Timer()
    
    var imageArray = [UIImageView]()
    
    @IBOutlet weak var hscoreTV: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countTV.text = "\(count)"
        scoreTV.text = "Score : \(score)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.downCount), userInfo: nil, repeats: true)
        
        levelTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.foo), userInfo: nil, repeats: true)
        
        if let highscore = UserDefaults.standard.integer(forKey: "highscore") as? Int{
            hscoreTV.text = "High Score : \(highscore)"
        }
        
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        let gestureRecognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.scoreUp))
        
        spy1.isUserInteractionEnabled = true
        spy1.addGestureRecognizer(gestureRecognizer1)
        spy2.isUserInteractionEnabled = true
        spy2.addGestureRecognizer(gestureRecognizer2)
        spy3.isUserInteractionEnabled = true
        spy3.addGestureRecognizer(gestureRecognizer3)
        spy4.isUserInteractionEnabled = true
        spy4.addGestureRecognizer(gestureRecognizer4)
        spy5.isUserInteractionEnabled = true
        spy5.addGestureRecognizer(gestureRecognizer5)
        spy6.isUserInteractionEnabled = true
        spy6.addGestureRecognizer(gestureRecognizer6)
        spy7.isUserInteractionEnabled = true
        spy7.addGestureRecognizer(gestureRecognizer7)
        spy8.isUserInteractionEnabled = true
        spy8.addGestureRecognizer(gestureRecognizer8)
        spy9.isUserInteractionEnabled = true
        spy9.addGestureRecognizer(gestureRecognizer9)
        
        imageArray.append(spy1)
        imageArray.append(spy2)
        imageArray.append(spy3)
        imageArray.append(spy4)
        imageArray.append(spy5)
        imageArray.append(spy6)
        imageArray.append(spy7)
        imageArray.append(spy8)
        imageArray.append(spy9)

        for spy in imageArray {
            spy.isHidden = true
        }
        
    }
    
    func foo(){
        
        for spy in imageArray {
            spy.isHidden = true
        }
        
        self.imageArray[Int(arc4random_uniform(9))].isHidden = false
        
    }
    

    func downCount(){
        count = count-1 ;
        countTV.text = "\(count)"
        
        if count == 0 {
            self.timer.invalidate()
            self.levelTimer.invalidate();
            
            let alert = UIAlertController(title: "Game Over", message: "Time's Up", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: {(action:UIAlertAction!) in
                print("you have pressed the ok button")
            })
            alert.addAction(okButton)
            let retryButton = UIAlertAction(title: "Replay", style: .default, handler:{(action:UIAlertAction!) in
                self.count = 10;
                self.score = 0;
                
                self.countTV.text = "\(self.count)"
                self.scoreTV.text = "Score : \(self.score)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.downCount), userInfo: nil, repeats: true)
                
                self.levelTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.foo), userInfo: nil, repeats: true)
            })

            alert.addAction(retryButton)
            self.present(alert, animated: true, completion: nil)
        
            if let highscore = UserDefaults.standard.integer(forKey: "highscore") as? Int{
                if score > highscore {
                    self.hscoreTV.text = "High Score : \(score)"
                    UserDefaults.standard.setValue(score, forKey: "highscore")
                }
            }else {
                self.hscoreTV.text = "High Score : \(score)"
                UserDefaults.standard.setValue(score, forKey: "highscore")
            }
        }
    }
    
    func scoreUp(){
        score = score + 1;
        scoreTV.text = "Score : \(score)"
    }


}

