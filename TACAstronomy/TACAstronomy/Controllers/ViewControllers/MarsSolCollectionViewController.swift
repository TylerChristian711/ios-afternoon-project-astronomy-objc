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
    var solToSend: TACMarsSol?
    
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
                self.collectionView.reloadData()
            }
        }
        photoOperation.addDependency(manifestFetchOperation)
        photoQueue.addOperation(manifestFetchOperation)
        OperationQueue.main.addOperation(photoOperation)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Segues.showSolDetailSegue:
            guard let detailVC = segue.destination as? MarsSolDetailViewController else { return }
            detailVC.sol = solToSend
        default:
            break
        }
    }
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sols.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.marsCell, for: indexPath) as? TACMarsSolCollectionViewCell else { return UICollectionViewCell() }
        let sol = sols[indexPath.item]
        guard let url = URL(string: sol.imageURL)?.usingHTTPS else { return UICollectionViewCell() }
        cell.configureCell(withImageURL: url)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sol = sols[indexPath.item]
        self.solToSend = sol
        performSegue(withIdentifier: Segues.showSolDetailSegue, sender: self)
    }
}

extension MarsSolCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return .zero }
        var totlaUsableWidth = collectionView.frame.width
        let inset = self.collectionView(collectionView, layout: collectionViewLayout, insetForSectionAt: indexPath.section)
        totlaUsableWidth -= inset.left + inset.right
        
        let minWidth: CGFloat = 150.0
        let numberOfItemsInOneRow = Int(totlaUsableWidth / minWidth)
        totlaUsableWidth -= CGFloat(numberOfItemsInOneRow - 1) * flowLayout.minimumInteritemSpacing
        let width = totlaUsableWidth / CGFloat(numberOfItemsInOneRow)
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
        
    }
}
