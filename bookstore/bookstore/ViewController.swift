//
//  ViewController.swift
//  bookstore
//
//  Created by Student on 13/09/23.
//  Copyright © 2023 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    var arrSubject = ["DSA", "SoftEng", "CPP", "iOS"]
    
    var DsaBook = ["Pearson", "Apress", "Thomas"]
    var DsaImg: [UIImage] = [#imageLiteral(resourceName: "ds1"), #imageLiteral(resourceName: "ds2"), #imageLiteral(resourceName: "ds3")]
    
    var SeBook = ["Amarjeet", "Deepak", "Girchari"]
    var SeImg: [UIImage] = [#imageLiteral(resourceName: "se1"), #imageLiteral(resourceName: "se2"), #imageLiteral(resourceName: "se3")]
    
    var CppBook = ["Mark", "Bjane", "Girchari", "xyz"]
    var CppImg: [UIImage] = [#imageLiteral(resourceName: "cpp1"), #imageLiteral(resourceName: "cpp2"), #imageLiteral(resourceName: "cpp3")]

    var IosBook = ["Simon", "Apress", "Vandad"]
    var IosImg: [UIImage] = [#imageLiteral(resourceName: "ios1"), #imageLiteral(resourceName: "ios2"), #imageLiteral(resourceName: "ios3")]
    
    @IBOutlet weak var ImageShuffle: UIImageView!
    @IBOutlet weak var BookSegment: UISegmentedControl!
    @IBOutlet weak var SegmentOut: UISegmentedControl!
    @IBAction func Subject(_ sender: Any) {
        
        let imgAnimation = {
            
            (image: [UIImage]) -> Void in
            self.ImageShuffle.animationImages = image
            self.ImageShuffle.animationDuration = 4
            self.ImageShuffle.animationRepeatCount = 0
            self.ImageShuffle.startAnimating()
        }
        
        let bookSegment = {
            
            (book: [String]) -> Void in
            
            for i in 0...2 {
                
                self.BookSegment.setTitle(book[i], forSegmentAt: i)
            }
        }
        
        switch SegmentOut.selectedSegmentIndex {
            
        case 0:
            BookSegment.selectedSegmentIndex = 0
            imgAnimation(DsaImg)
            bookSegment(DsaBook)
            BookSegment.removeSegment(at: 3, animated: false)
            
        case 1:
            BookSegment.selectedSegmentIndex = 0
            imgAnimation(SeImg)
            bookSegment(SeBook)
            BookSegment.removeSegment(at: 3, animated: false)
            
        case 2:
            BookSegment.insertSegment(with: nil, at: 3, animated: false)
            BookSegment.selectedSegmentIndex = 0
            imgAnimation(CppImg)
            bookSegment(CppBook)
            BookSegment.setTitle("Saksham", forSegmentAt: 3)
            
        case 3:
            BookSegment.selectedSegmentIndex = 0
            imgAnimation(IosImg)
            bookSegment(IosBook)
            BookSegment.removeSegment(at: 3, animated: false)
            
        default:
            break
        }
    }
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var age: UILabel!
    @IBAction func ageSlider(_ sender: UISlider) {
        
        age.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var copies: UILabel!
    @IBAction func countSlider(_ sender: UISlider) {
        
        copies.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var Male: UILabel!
    @IBOutlet weak var Female: UILabel!
    @IBOutlet weak var sexOut: UISwitch!
    @IBAction func sex(_ sender: Any) {
        
        if sexOut.isOn {
            Female.isHidden = true
            Male.isHidden = false
        }
        else {
            Male.isHidden = true
            Female.isHidden = false
        }
    }
    
    @IBOutlet weak var displayText: UILabel!
    @IBAction func submit(_ sender: Any) {
        
        let gender = sexOut.isOn ? "Male" : "Female"
        let subject = SegmentOut.titleForSegment(at: SegmentOut.selectedSegmentIndex)!
        let name = nameText.text!
        let ag = age.text!
        let book = BookSegment.titleForSegment(at: BookSegment.selectedSegmentIndex)!
        let copy = copies.text!
        //let price = Int(copy) * 100
        
        displayText.text = """
        Subject:  \(subject)
        Name: \(name)
        Age: \(ag)
        Gender: \(gender)
        Book: \(book)
        Copies: \(copy)
        """
    }
    
}

