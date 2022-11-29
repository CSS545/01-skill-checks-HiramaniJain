//
//  ViewController.swift
//  HW1
//
//  Created by Heeral Jain on 10/9/22.
//

import UIKit

class FirstPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ActivityViewController().fetchActivity()
    }


}

