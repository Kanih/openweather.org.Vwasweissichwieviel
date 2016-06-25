//
//  Secondview Controller.swift
//  openweather.org.Vwasweissichwieviel
//
//  Created by Nicolai Kaschta on 25.06.16.
//  Copyright © 2016 Nicolai Kaschta. All rights reserved.
//

import Foundation
import UIKit

class SecondviewController: UIViewController {
    
    @IBOutlet weak var windrichtung: UILabel!
    var windr = String()
    
    override func viewWillAppear(animated: Bool) {
        //super.viewWillAppear(animated)
        //connect()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        windrichtung.text = (NSString(format: "%.1f", windr) as String)+"%" as String

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    


}