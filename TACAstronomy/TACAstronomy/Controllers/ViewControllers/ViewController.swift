//
//  ViewController.swift
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let manifestFetcher = TACManifestFetcher()
    var manifest: TACMarsMissionManifest?
    let solFetcher = TACSolFetcher()

    override func viewDidLoad() {
        super.viewDidLoad()
        manifestFetcher.fetchManifest(forRover: "curiosity") { (manifest, error) in
            guard error == nil else { return }
            
            guard let manifest = manifest else { return }
            print(manifest.sols)
        }
        
        solFetcher.fetchPhotos(forRover: "curiosity", withSol: 1000) { (sols, error) in
            guard error == nil else { return }
            guard let sols = sols else { return }
            print(sols)
        }
    }
}
