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

        if let image = ToDoTaskStore.shared.selectedImage {
            imageView.image = image
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    @IBAction func close(_ sender: AnyObject) {
        ToDoTaskStore.shared.selectedImage = nil
        dismiss(animated: true, completion: nil)
    }

}









