//
//  ViewController.swift
//  Images
//
//  Created by Giovanni on 18/12/2015.
//  Copyright © 2015 mokacoding. All rights reserved.
//

import UIKit
import WebImage

let cellIdentifier = "cellIdentifier"

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let spacing: CGFloat = 8

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SDWebImage Demo"

        collectionView?.backgroundColor = UIColor.whiteColor()
        collectionView?.registerNib(UINib(nibName: "Cell", bundle: nil), forCellWithReuseIdentifier: cellIdentifier)

        collectionView?.collectionViewLayout = UICollectionViewFlowLayout()
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
    }

    // MARK:

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! Cell

        // 2. How to cancel an image load
        //
        // SDWebImageManager.sharedManager().cancelAll()
        // cell.imageView.sd_cancelCurrentImageLoad()

        cell.imageView.image = nil

        if let url = NSURL(string: "http://pokeapi.co/media/img/\(indexPath.item + 1).png") {
            // 1. How to load an image
            //
            //cell.imageView.sd_setImageWithURL(url)
            cell.imageView.alpha = 0
            cell.imageView.sd_setImageWithURL(url) { image, error, cacheType, url in
                UIView.animateWithDuration(1) {
                    cell.imageView.alpha = 1
                }
            }

            // 3. How to use the manager
            //
            /*
            SDWebImageManager.sharedManager().downloadImageWithURL(url,
                options: [], progress: nil) { (downloadedImage:UIImage!, error:NSError!, cacheType:SDImageCacheType, isDownloaded:Bool, withURL:NSURL!) -> Void in

                    // 4. How to load with fading
                    //
                    cell.imageView.alpha = 0
                    cell.imageView.image = downloadedImage

                    UIView.animateWithDuration(1) {
                        cell.imageView.alpha = 1
                    }

            }
            */
        }

        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        // FIXME: What I'd like to do is have 3 cells equally spaced.
        // This is the quickest thing I came up with
        // If you know how to do it would you open a PR? Thanks :)
        let numberOfCells = 4
        let availableWidth = floor(view.frame.size.width) - 2 * spacing
        let side = availableWidth / CGFloat(numberOfCells)
        return CGSize(width: side, height: side)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return spacing
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
}
