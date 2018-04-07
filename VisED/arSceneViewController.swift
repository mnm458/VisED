//
//  arSceneViewController.swift
//  VisED
//
//  Created by Mohak Malhotra on 7/4/18.
//  Copyright © 2018 Mohak Malhotra. All rights reserved.
//

import UIKit
import ARKit
import Firebase
class arSceneViewController: UIViewController {

    @IBOutlet weak var arView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
        let modelRef = storage.reference(forURL: "gs://vised-8c24e.appspot.com/t1/wk1/y8bi001mdl1/dna.scn")
        let nsDocumentDirectory:FileManager.SearchPathDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let nsUserDomainMask:FileManager.SearchPathDomainMask = FileManager.SearchPathDomainMask.userDomainMask;
        
        let paths:[String] = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true);
         var folderPath = ""
        if (paths.count > 0) {
            
          folderPath = String(paths[0]);
            folderPath =  "file:" + folderPath + "/dna.scn"
            print(folderPath);
           
        }
        let  localUrl = URL(string: folderPath)!
    
        let downloadTask = modelRef.write(toFile: localUrl) { url, error in
            if let error = error {
                print (error)
            } else {
                // Local file URL for "images/island.jpg" is returned
                let finalUrl = url!
                print(url)
                self.arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
                self.arView.session.run(self.configuration)
                do{
                
                let scene = try SCNScene(url:  finalUrl, options: nil)
                    
            } catch {}
              
                
            }
        }
     
    

        
       
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
