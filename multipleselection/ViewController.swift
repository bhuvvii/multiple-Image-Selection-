//
//  ViewController.swift
//  multipleselection
//
//  Created by user on 27/09/18.
//  Copyright © 2018 Contus. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker
import CropViewController


class ViewController: UIViewController,CropViewControllerDelegate{
// var  selectedassets = [PHAsset]()
//    var photoarray = UIImage()

    
@IBOutlet weak var collectionview: UICollectionView!
    var Select = [PHAsset]()
    var arrimg = [UIImage]()
    
    
    // MARK: Properties
    /// Cropping Style Default
    private var croppingStyle = CropViewCroppingStyle.default
    /// Cropping Rect
    private var croppedRect = CGRect.zero
    /// Cropping Angle
    private var croppedAngle = 0
    @IBOutlet weak var imageview: UIImageView!
    
@IBAction func showImagePicker(_ sender: UIButton) {
        
        let imgPkr = BSImagePickerViewController()
        
//        imgPkr.maxNumberOfSelections = 4
        
        self.bs_presentImagePickerController(imgPkr, animated: true, select: {(asset : PHAsset) -> Void in }, deselect: {(asset : PHAsset) -> Void in}, cancel: {(assets : [PHAsset]) -> Void in}, finish: {(assets : [PHAsset]) -> Void in
            
            for i in 0..<assets.count
            {
                self.Select.append(assets[i])
                
            }
        }, completion: nil)}
    
    @objc func getAllImg() -> Void
    {
        
        if Select.count != 0{
            for i in 0..<Select.count{
                let manager = PHImageManager.default()
                let option = PHImageRequestOptions()
                var thumbnail = UIImage()
                option.isSynchronous = true
                manager.requestImage(for: Select[i], targetSize: PHImageManagerMaximumSize, contentMode: .aspectFill, options: option, resultHandler: {(result, info)->Void in
                    thumbnail = result!
                })
                
                self.arrimg.append(thumbnail)
                
            }
        }
        
        collectionview.reloadData()
        
        
    }
//    public func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
//        self.croppedRect = cropRect
//        self.croppedAngle = angle
//       self.arrimg.index(after: 0)
//        cropViewController.dismiss(animated: true, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        checkPhotoLibraryPermission()
        //        setupCollectionViewDelegates()
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainstoryboard :UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let desc = mainstoryboard.instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        desc.getallimage = arrimg
        print("image>>>>>",arrimg)
        desc.getIndex = indexPath.row
        print("index>>>>>>",indexPath)
        self.navigationController?.pushViewController(desc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.perform(#selector(ViewController.getAllImg), with: nil, afterDelay: 0.5)
    }
}


    
    extension ViewController : UICollectionViewDataSource,UICollectionViewDelegate{
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return arrimg.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            
            cell.imagecollection.image = arrimg[indexPath.row]
//            cell.imagecollection.backgroundColor = UIColor.black
            
//            
            return cell
        }
    }



    
    
        
//        let vc = BSImagePickerViewController()
//        vc.maxNumberOfSelections = 5
//        bs_presentImagePickerController(vc, animated: true,
//                                        select: { (asset: PHAsset) -> Void in
//                                            print("Selected: \(asset)")
//        }, deselect: { (asset: PHAsset) -> Void in
//            print("Deselected: \(asset)")
//        }, cancel: { (assets: [PHAsset]) -> Void in
//            print("Cancel: \(assets)")
//        }, finish: { (assets: [PHAsset]) -> Void in
//            print("Finish: \(assets)")
//            if let imageView = vc{
//                PHCachingImageManager.default().requestImage(for: assets, targetSize:imageView.frame.size, contentMode: .aspectFit) { (result, _) in
//                    imageView.image = result
//                }
//            }
//        }, completion: nil)
//            for i in 0..<assets.count{
//                self.selectedassets.append(assets[i])
//            }
//            self.convertToImages()
//        },completion: nil)

    
//    func convertToImages()->Void {
//        if selectedassets.count != 0{
//
//        for i in 0..<selectedassets.count{
//            let manager = PHImageManager.default()
//            let option = PHImageRequestOptions()
//            var thumbanil = UIImage()
//            option.isSynchronous = true
//
//            manager.requestImage(for:selectedassets[i] , targetSize: CGSize(width: 200, height: 200), contentMode: .aspectFill, options:option, resultHandler: {(result,info)->Void in
//                thumbanil = result!
//            })
//            let data = UIImageJPEGRepresentation(thumbanil, 0.7)
//            let newimage = UIImage(data: data!)
//            self.photoarray.append(newimage! as UIImage)
//            self.photoarray.
//
//        }
//          self.imageview.animationImages = self.photoarray
//            self.imageview.animationDuration = 3.0
//            self.imageview.startAnimating()
//    }
//        print("complete photo array\(self.photoarray)" )
//
//    }
//


//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
//        cell.imagecollection.image = image[indexPath.row]
//        return cell
//    }

    






