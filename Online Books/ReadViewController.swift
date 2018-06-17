//
//  FirstViewController.swift
//  Online Books
//
//  Created by Samuel Miller on 17/06/2018.
//  Copyright © 2018 Cracksoft. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var titlelabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        content.text = MyData.sharedInstance.bookContent
        titlelabel.text = MyData.sharedInstance.selectedBook
    }


}

