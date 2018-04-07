//
//  arSceneViewController.swift
//  VisED
//
//  Created by Mohak Malhotra on 7/4/18.
//  Copyright © 2018 Mohak Malhotra. All rights reserved.
//

import UIKit
import ARKit

class arSceneViewController: UIViewController {

    @IBOutlet weak var arView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.arView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.arView.session.run(configuration)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
