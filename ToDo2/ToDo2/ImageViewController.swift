//
//  ImageViewController.swift
//  ToDo
//
//  Created by Caden Cheek on 12/5/16.
//  Copyright © 2016 Interapt. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = TaskStore.shared.selectedImage {
            imageView.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func close(_ sender: AnyObject) {
        TaskStore.shared.selectedImage = nil
        dismiss(animated: true, completion: nil)
    }

}
