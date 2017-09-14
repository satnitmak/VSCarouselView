## Introduction
`VSCarouselView` is a simple horizontal carousel implemented using UICollectionView. It has been implemented on Swift 3.0

## Demo
![alt tag](http://i.imgur.com/utvBuCi.gif)

Run the project to check it out.

## Installation
Copy the files from Lib folder into your project before using.

To understand how to use VSCarouselView please refer to ViewController.swift

## Usage
Initialize View
```
carouselView = Bundle.main.loadNibNamed("VSCarouselView", owner: self, options: nil)?.first as? VSCarouselView
```

Add carousel to your view and give a frame as per your requirement
```
carouselView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 400)
view.addSubview(carouselView)
```
Register carousel with collection view cell nibs and finally call render method
```
let cellTuple = [(UINib(nibName: ProductImageAdCollectionCell.nibName, bundle: nil), ProductImageAdCollectionCell.reuseID)]
carouselView.renderView(withDelegate: self, cellTuple: cellTuple)
```
Implement CarouselDelegate Protocol methods
```
func clickAction(atIndexPath indexPath: IndexPath) // optional
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
```
