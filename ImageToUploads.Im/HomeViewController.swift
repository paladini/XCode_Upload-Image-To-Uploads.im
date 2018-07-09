//
//  ViewController.swift
//  ImageToUploads.Im
//
//  Created by 1Doc Tecnologia on 09/07/18.
//  Copyright © 2018 Fernando Paladini. All rights reserved.
//

import Cocoa

class HomeViewController: NSViewController {

    @IBOutlet weak var imageView: NSImageView!
    @IBOutlet weak var dragView: DragView!
    @IBOutlet weak var loadingSpinner: NSProgressIndicator!
    @IBOutlet weak var staticLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

