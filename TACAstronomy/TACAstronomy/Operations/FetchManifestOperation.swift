//
//  FetchManifestOperation.swift
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import Foundation

class fetchManifestOperation: ConcurrentOperation {
    
    let manifestFetcher: TACManifestFetcher
    var manifest: TACMarsMissionManifest?
    
    init(manifestFetcher: TACManifestFetcher) {
        self.manifestFetcher = manifestFetcher
    }
    
    override func start() {
        state = .isExecuting
        
        manifestFetcher.fetchManifest(forRover: "curiosity") { (manifest, error) in
            defer { self.state = .isFinished }
            guard error == nil else { return }
            guard let manifest = manifest else { return }
            self.manifest = manifest
        }
    }
}
