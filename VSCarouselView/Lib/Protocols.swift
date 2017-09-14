//
//  Protocols.swift
//  VSCarouselView
//
//  Created by Sathyanarayanan V on 9/13/17.
//  Copyright © 2017 Sathyanarayanan V. All rights reserved.
//
import UIKit

// MARK: Carousel Contraints Protocol
protocol CarouselConstraintsProtocol {
    var topMargin: CGFloat {get}   // top bottom margins of cards
    var refVelocity: CGFloat {get} // scroll velocities more than this would cause a page change in the swipe view
    var widthMargin: CGFloat {get} // horizontal gap between 2 cards
    var defaultViewWidth: CGFloat {get}
    var defaultCardWidth: CGFloat {get} // scaled width of card wrt carouselv iew width
}

extension CarouselConstraintsProtocol {
    var topMargin: CGFloat {return 6}
    var refVelocity: CGFloat {return 0.2}
    var widthMargin: CGFloat {return 12}
    var defaultViewWidth: CGFloat {return 360}
    var defaultCardWidth: CGFloat {return 303}
}

// MARK: Carousel DataSource/Action Protocol
protocol CarouselDelegate: UICollectionViewDataSource {
    func clickAction(atIndexPath indexPath: IndexPath)
}

extension CarouselDelegate{
    func clickAction(atIndexPath indexPath: IndexPath) { }
}

