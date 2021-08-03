//
//  ViewController.swift
//  Video210803
//
//  Created by Mingeun Yang on 2021/08/03.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var videoManager = VideoManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videoManager.getVideo { response in
            
        }
    }


}

