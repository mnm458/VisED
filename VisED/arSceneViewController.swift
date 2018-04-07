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
class arSceneViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var arView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arView.delegate = self
        
        }
     
    

    
       
    
    override func viewDidAppear(_ animated: Bool) {
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
                    //-----end firebase storage
            
                do{
                    
                    let scene =  SCNScene()
                     self.arView.scene = scene
                    self.arView.session.run(self.configuration)
                    var nodeModel:SCNNode!
                    let modelScene = try SCNScene(url:  finalUrl, options: nil)
                    let nodeName = "face0"
                    nodeModel = modelScene.rootNode.childNode(
                        withName: nodeName, recursively: true)
                    nodeModel.position = SCNVector3Zero
                    self.arView.scene.rootNode.addChildNode(nodeModel)
                    
                } catch {}
                
                
            }
    }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
