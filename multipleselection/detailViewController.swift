    //
//  detailViewController.swift
//  multipleselection
//
//  Created by user on 28/09/18.
//  Copyright © 2018 Contus. All rights reserved.
//

import UIKit
import CropViewController

    
class detailViewController: UIViewController,CropViewControllerDelegate,UIImagePickerControllerDelegate {
    // MARK: Properties
    /// Cropping Style Default
    private var croppingStyle = CropViewCroppingStyle.default
    /// Cropping Rect
    private var croppedRect = CGRect.zero
    /// Cropping Angle
    private var croppedAngle = 0
    @IBOutlet weak var crop: UIView!
    @IBOutlet weak var detailmage: UIImageView!
    var image = UIImage()
    var getIndex = Int()
    var getallimage = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
//        detailmage.image = image
        detailmage.image = getallimage[getIndex]
        
//        let imgData: NSData = NSData(data: UIImageJPEGRepresentation((detailmage.image)!, 0.5)!)
//        let imageSize: Int = imgData.length
//        print("size of image in MB: %f ", Double(imageSize) / 1024.0)
        let cropController = CropViewController(croppingStyle: croppingStyle, image: detailmage.image!)
        cropController.delegate = self
//           self.image = image
//        self.detailmage.image = image
//        detailmage = [getallimage] as? UIImageView
        self.present(cropController, animated: true, completion: nil)
    }
    public func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        self.croppedRect = cropRect
        self.croppedAngle = angle
        self.detailmage.image=image;
        
        getallimage[getIndex] = detailmage.image!
        print("getallimage",getallimage)
//        updateImageViewWithImage(image, fromCropViewController: cropViewController)
        cropViewController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Backbutton(_ sender: Any) {
        let mainstoryboard :UIStoryboard = UIStoryboard (name: "Main", bundle: nil)
        let desc = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        getallimage[getIndex] = detailmage.image as! UIImage
        desc.arrimg = getallimage as [UIImage]
//        desc.arrimg = [detailmage.image as! UIImage]
        print("arrimg>>>>>",detailmage)
        
//        desc.getIndex = indexPath.row
        self.navigationController?.pushViewController(desc, animated: true)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    }
    
    
   
        
