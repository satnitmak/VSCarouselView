//
//  VSCarouselView.swift
//  ICEKit
//
//  Created by Sathyanarayanan V on 5/24/17.
//  Copyright © 2017 OLA. All rights reserved.
//

import UIKit

// MARK: Carousel Class
class VSCarouselView: UIView, CarouselConstraintsProtocol {
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    let layout = CarouselFlowLayout()
    weak var delegate: CarouselDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate =  UIScrollViewDecelerationRateFast // scrolls fast for minor flicks
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateCollectionViewLayout()
    }
    
    fileprivate func updateCollectionViewLayout() {
        let width = frame.size.width
        layout.scrollDirection = .horizontal
        layout.count = collectionView.numberOfItems(inSection: 0)
        layout.width = width
        collectionView.collectionViewLayout = layout
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func renderView(withDelegate delegate: CarouselDelegate, cellTuple: [(UINib, String)]) {
        for tuple in cellTuple {
            collectionView.register(tuple.0, forCellWithReuseIdentifier: tuple.1)
        }
        
        self.delegate = delegate
        collectionView.delegate = self
        collectionView.dataSource = delegate
        collectionView.reloadData()
    }
}

extension VSCarouselView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewHeight = frame.size.height - (2 * topMargin)
        let viewWidth = defaultCardWidth * frame.size.width/defaultViewWidth
        return CGSize(width: viewWidth, height: viewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = (widthMargin * frame.size.width/defaultViewWidth)
        return UIEdgeInsets(top: 0.0, left: inset, bottom: 0.0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let width = frame.size.width
        return widthMargin * width/defaultViewWidth
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.clickAction(atIndexPath: indexPath)
    }
}

// MARK: Carousel Contraints Protocol
class CarouselFlowLayout: UICollectionViewFlowLayout, CarouselConstraintsProtocol {
    
    var index = 0
    
    var width: CGFloat? // width of entire view
    var count: Int? // number of items
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        guard let width = width, let count = count else { return proposedContentOffset }
        // Find Correct Index
        if velocity.x > refVelocity || velocity.x < -refVelocity {
            index += (velocity.x > 0) ? 1 : -1
        } else if let collectionView = collectionView{
            let point = CGPoint(x: collectionView.contentOffset.x + width/2, y: collectionView.frame.size.height/2)
            index = collectionView.indexPathForItem(at: point)?.row ?? Int(floor((collectionView.contentOffset.x + width)/width))
        }
        var offSetToReturn = proposedContentOffset
        // Return Correct Offset
        if index <= 0 {
            index = 0
            offSetToReturn = CGPoint.init(x:0 , y: 0.0)
        } else if index >= count - 1{
            index = count - 1
            let xPoint = CGFloat(widthMargin + ((defaultCardWidth + widthMargin) * CGFloat(index))) * width/CGFloat(defaultViewWidth)
            offSetToReturn = CGPoint.init(x:xPoint , y: 0.0)
        }else {
            let xPoint = CGFloat(widthMargin + ((defaultCardWidth + widthMargin) * CGFloat(index)) - (defaultViewWidth - defaultCardWidth) * 0.5) * width/CGFloat(defaultViewWidth)
            offSetToReturn = CGPoint.init(x:xPoint , y: 0.0)
        }
        return offSetToReturn
    }
    
}
