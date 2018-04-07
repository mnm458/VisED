//
//  show3DModelsViewController.swift
//  VisED
//
//  Created by Mohak Malhotra on 7/4/18.
//  Copyright © 2018 Mohak Malhotra. All rights reserved.
//

import UIKit
import Firebase

let term = "1"
let weeek = "1"
let subjectId = "y8bi001"
class show3DModelsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
        let modelRef = storage.reference(forURL: "gs://vised-8c24e.appspot.com/t1/wk1/y8bi001mdl1/dna.dae")
        let maxSize: Int64 =  10 * 1024 * 1024
      modelRef.getData(maxSize: maxSize) { data, error in
            if let error = error {
               print(error)
            } else {
                // Data for "images/island.jpg" is returned
                let file = NSData(data: data!)
                print("downloaded successfully")
                print(file)
                //data saved
                UserDefaults.standard.set(file, forKey: "y8bi001wk1mdl1")
                //decoding
                let data = UserDefaults.standard.object(forKey: "y8bi001wk1mdl1") as! NSData
                
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
