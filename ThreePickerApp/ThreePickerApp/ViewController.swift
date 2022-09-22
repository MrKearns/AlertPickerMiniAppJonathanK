//
//  ViewController.swift
//  ThreePickerApp
//
//  Created by Jonathan Kearns on 9/19/22.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet var jailView: UIView!
    
    
    var digitOne: [String] = [String]()
    var digitTwo: [String] = [String]()
    var digitThree: [String] = [String]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myPicker?.delegate = self
        myPicker?.dataSource = self
        digitOne = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        digitTwo = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        digitThree = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component{
            case 0: return digitOne.count
            case 1: return digitTwo.count
        default: return digitThree.count
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
            case 0: return digitOne[row]
            case 1: return digitTwo[row]
        default: return digitThree[row]
        }
    }

    @IBAction func userAttempt(_ sender: UIButton) {
        
        let correctCombination = "1 8 6"
        
        let petIndex = myPicker.selectedRow(inComponent: 0)
        let homeIndex = myPicker.selectedRow(inComponent: 1)
        let placeIndex = myPicker.selectedRow(inComponent: 2)
        
        let userCombination = "\(digitOne[petIndex]) \(digitTwo[homeIndex]) \(digitThree[placeIndex])"
        print(userCombination)
        
        if userCombination == correctCombination{
            let alert = UIAlertController(title: "💰Correct!💰", message: "\(digitOne[petIndex]) \(digitTwo[homeIndex]) \(digitThree[placeIndex])", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
                let newViewConrtoller = self.storyboard?.instantiateViewController(withIdentifier: "openSafeView")
                    self.present(newViewConrtoller!, animated: true, completion: nil)
                
            })
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        else{
            let alert = UIAlertController(title: "🚨 Incorrect 🚨 ", message: "The police have been called.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
                let newViewConrtoller = self.storyboard?.instantiateViewController(withIdentifier: "jailView")
                    self.present(newViewConrtoller!, animated: true, completion: nil)
                
                
            })
            
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
  
    
}

