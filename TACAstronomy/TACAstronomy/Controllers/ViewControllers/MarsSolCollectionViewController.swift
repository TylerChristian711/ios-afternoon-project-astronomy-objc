//
//  MarsSolCollectionViewController.swift
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit



class MarsSolCollectionViewController: UICollectionViewController {
    
    
    
    let manifestFetcher = TACManifestFetcher()
    var manifest: TACMarsMissionManifest?
    let solFetcher = TACSolFetcher()
    let photoQueue = OperationQueue()
    var sols = [TACMarsSol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPhotos()
    }
    
    private func loadPhotos() {
        let manifestFetchOperation = fetchManifestOperation(manifestFetcher: manifestFetcher)
        let photoOperation = BlockOperation {
            self.solFetcher.fetchPhotos(forRover: "curiosity", withSol: manifestFetchOperation.manifest!.sols[0] as! NSNumber) { sols, error in
                guard error == nil else { return }
                guard let sols = sols as? [TACMarsSol] else { return }
                self.sols = sols
            }
        }
        photoOperation.addDependency(manifestFetchOperation)
        photoQueue.addOperation(manifestFetchOperation)
        OperationQueue.main.addOperation(photoOperation)
        
    }
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "", for: indexPath)
        
        // Configure the cell
        
        return cell
    }
    
    
}



