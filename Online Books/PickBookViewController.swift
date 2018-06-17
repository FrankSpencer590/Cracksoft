//
//  SecondViewController.swift
//  Online Books
//
//  Created by Samuel Miller on 17/06/2018.
//  Copyright © 2018 Cracksoft. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var readlabel: UILabel!
    
    var titles = [String]()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        readlabel.isHidden = true
        
        if let url = URL(string: "https://s3.amazonaws.com/watchappbooks/Books-Content/Story_Names.txt") {
            do {
                let contentsQUOTES = try String(contentsOf: url)
                titles = [String]()
                contentsQUOTES.enumerateLines { (line, stop) -> () in
                    self.titles.append(line)
                    print(self.titles)
                }
            } catch {
                // contents could not be loaded
                self.titles.append("not loaded")
            }
        } else {
            // the URL was bad!
            self.titles.append("bad url")
        }
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return titles[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return titles.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        readlabel.text = ("Read "+titles[row]+" in the 'Read' Tab")
        readlabel.isHidden = false
        MyData.sharedInstance.selectedBook = titles[row]
        let bookid = titles[row].replacingOccurrences(of: " ", with: "").lowercased()
        if let url = URL(string: "https://s3.amazonaws.com/watchappbooks/Books-Content/"+bookid+".txt") {
            do {
                let contentsQUOTES = try String(contentsOf: url)
                MyData.sharedInstance.bookContent = contentsQUOTES

            } catch {
                // contents could not be loaded
                MyData.sharedInstance.bookContent = ("fail")
            }
        }
    }
        


}
