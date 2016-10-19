//
//  ViewController.swift
//  Programming Exercises 1
//
//  Created by Chad Wiedemann on 10/19/16.
//  Copyright © 2016 Chad Wiedemann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberInStringText: UILabel!
    @IBOutlet weak var numberToBeConvertedTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createNumberUnder20(number: NSInteger) -> String {
        switch number {
        case 0:
            return ""
        case 1:
            return "one"
        case 2:
            return "two"
        case 3:
            return "three"
        case 4:
            return "four"
        case 5:
            return "five"
        case 6:
            return "six"
        case 7:
            return "seven"
        case 8:
            return "eight"
        case 9:
            return "nine"
        case 10:
            return "ten"
        case 11:
            return "eleven"
        case 12:
            return "twelve"
        case 13:
            return "thirteen"
        case 14:
            return "fourteen"
        case 15:
            return "fifteen"
        case 16:
            return "sixteen"
        case 17:
            return "seventeen"
        case 18:
            return "eighteen"
        default:
            return "nineteen"
        }
    }
    
    func createNumberForBuildingTens(number: NSInteger) -> String {
        switch number {
        case 0:
            return ""
        case 1:
            return "one"
        case 2:
            return "two"
        case 3:
            return "three"
        case 4:
            return "four"
        case 5:
            return "five"
        case 6:
            return "six"
        case 7:
            return "seven"
        case 8:
            return "eight"
        default:
            return "nine"
        }
    }
    
    func createNumberLessThan100(number: NSInteger) -> String {
        if number<20{
            return createNumberUnder20(number: number)
            
        }else{
        switch number {
            case 90...99:
                return "ninty " + createNumberForBuildingTens(number: number-90)
            case 80...89:
                return "eighty " + createNumberForBuildingTens(number: number-80)
            case 70...79:
                return "seventy " + createNumberForBuildingTens(number: number-70)
            case 60...69:
                return "sixty " + createNumberForBuildingTens(number: number-60)
            case 50...59:
                return "fifty " + createNumberForBuildingTens(number: number-50)
            case 40...49:
                return "fourty " + createNumberForBuildingTens(number: number-40)
            case 30...39:
                return "thirty " + createNumberForBuildingTens(number: number-30)
            default:
                return "twenty " + createNumberForBuildingTens(number: number-20)
    
            }
        }
    }
    
    func createNumberLessThan1000(number: NSInteger) -> String {
        if number<100{
            return createNumberLessThan100(number: number)
        }
        switch number {
        case 100...199:
            if number == 100{
                return "one hundred"
            }
            return "one hundred and " + createNumberLessThan100(number: number-100)
        case 200...299:
            if number == 200{
                return "two hundred"
            }
            return "two hundred and " + createNumberLessThan100(number: number-200)
        case 300...399:
            if number == 300{
                return "three hundred"
            }
            return "three hundred and " + createNumberLessThan100(number: number-300)
        case 400...499:
            if number == 400{
                return "four hundred"
            }
            return "four hundred and " + createNumberLessThan100(number: number-400)
        case 500...599:
            if number == 500{
                return "five hundred"
            }
            return "five hundred and " + createNumberLessThan100(number: number-500)
        case 600...699:
            if number == 600{
                return "six hundred"
            }
            return "six hundred and " + createNumberLessThan100(number: number-600)
        case 700...799:
            if number == 700{
                return "seven hundred"
            }
            return "seven hundred and " + createNumberLessThan100(number: number-700)
        case 800...899:
            if number == 800{
                return "eight hundred"
            }
            return "eight hundred and " + createNumberLessThan100(number: number-800)
        default:
            if number == 900{
                return "nine hundred"
            }
            return "nine hundred and " + createNumberLessThan100(number: number-900)
        }
    }
    
    func createNumberLessThan1000000(number: NSInteger) -> String {
        if number<1000{
            return createNumberLessThan1000(number: number)
        }
        let reducedNum = number/1000;
        let hunderedsNumber = number - reducedNum*1000
        return createNumberLessThan1000(number: reducedNum) + " thousand " + createNumberLessThan1000(number: hunderedsNumber)
    }
    
    func createNumberLessThanBillion(number: NSInteger) -> String {
        if number<1000000{
            return createNumberLessThan1000000(number: number)
        }
        let reducedNum = number/1000000;
        let hunderedsNumber = number - reducedNum*1000000
        return createNumberLessThan1000(number: reducedNum) + " million " + createNumberLessThan1000000(number: hunderedsNumber)
    }
    
    func createNumberLessThanTrillion(number: NSInteger) -> String {
        if number<1000000000{
            return createNumberLessThanBillion(number: number)
        }
        let reducedNum = number/1000000000;
        let hunderedsNumber = number - reducedNum*1000000000
        return createNumberLessThan1000(number: reducedNum) + " billion " + createNumberLessThanBillion(number: hunderedsNumber)
    }
    
    
    @IBAction func convertNumberToStringButton(_ sender: AnyObject) {
        let myInt = Int(self.numberToBeConvertedTextField.text!)
        
        
        if myInt == 0 {
            self.numberInStringText.text = "zero"
        }else if myInt! >= 1000000000000{
            self.numberInStringText.text =  "The number is too big"
        }else{
        self.numberInStringText.text  = createNumberLessThanTrillion(number: myInt!)
        }
    }
}

