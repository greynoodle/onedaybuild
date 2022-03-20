//
//  ViewController.swift
//  onedaybuild
//
//  Created by Tj on 3/9/22.
//  Copyright © 2022 Yusif Tijani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        model.getVideos()
    }


}

