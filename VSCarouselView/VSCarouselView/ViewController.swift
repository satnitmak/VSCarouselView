//
//  ViewController.swift
//  VSCarouselView
//
//  Created by Sathyanarayanan V on 8/31/17.
//  Copyright © 2017 Sathyanarayanan V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var carouselView: VSCarouselView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carouselView = Bundle.main.loadNibNamed("VSCarouselView", owner: self, options: nil)?.first as? VSCarouselView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let carouselView = carouselView else { return }
        view.addSubview(carouselView)
        carouselView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 400)
        view.addSubview(carouselView)
        let cellTuple = [(UINib(nibName: ProductImageAdCollectionCell.nibName, bundle: nil), ProductImageAdCollectionCell.reuseID)]
        carouselView.renderView(withDelegate: self, cellTuple: cellTuple)
    }
}

extension ViewController: CarouselDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductImageAdCollectionCell.reuseID, for: indexPath)
        return cell
    }
}

