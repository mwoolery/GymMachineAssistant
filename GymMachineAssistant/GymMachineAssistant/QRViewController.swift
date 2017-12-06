//
//  FirstViewController.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit
import AVFoundation
//code we used to for QR read functionality from https://github.com/appcoda/QRCodeReader
// it was covered on the site https://www.appcoda.com/barcode-reader-swift/


class QRViewController : UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    
    // create the session to capture a QR Code
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    // Code types that it could potentially scan.  We will scan QR Codes though but this opens opprotunities to other types
    let supportedCodeTypes = [AVMetadataObject.ObjectType.upce,
                              AVMetadataObject.ObjectType.code39,
                              AVMetadataObject.ObjectType.code39Mod43,
                              AVMetadataObject.ObjectType.code93,
                              AVMetadataObject.ObjectType.code128,
                              AVMetadataObject.ObjectType.ean8,
                              AVMetadataObject.ObjectType.ean13,
                              AVMetadataObject.ObjectType.aztec,
                              AVMetadataObject.ObjectType.pdf417,
                              AVMetadataObject.ObjectType.qr]
    
    // Bring the list of Machines to the viewcontroller, so we will know what is available
    var myMachines = CoreDataModel.fetchAllItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // Everything is in here since the capture session will need to be reset each time we come back
    // Below code is from the AppCoda example, somewhat modified but we could'nt do it with out them
    override func viewWillAppear(_ animated: Bool) {
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession?.startRunning()
            
            // makes the green box around it. Actually happens so fast that you probably will miss it
            qrCodeFrameView = UIView()
            
            if let qrCodeFrameView = qrCodeFrameView {
                qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
                qrCodeFrameView.layer.borderWidth = 2
                view.addSubview(qrCodeFrameView)
                view.bringSubview(toFront: qrCodeFrameView)
            }
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This was added in to limit the likliness of extra view controllers being instantiated.
    // This just ensures that the capture sessions stops as soon we leave the view
    override func viewWillDisappear(_ animated: Bool) {
        if captureSession?.isRunning == true {
            captureSession?.stopRunning()
        }
    }
    
    
    
    
    // For AVCaptureMetadataDelegate, modified to instantiate view controller instead of just display what is read
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            //messageLabel.text = "No QR/barcode is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        //if it is a valid code, then do things inside
        if supportedCodeTypes.contains(metadataObj.type) {
            // since we found the code, stop running the capture session, doesn't always stop immediately though
            // which is why we decided to include this in a couple of places
            self.captureSession?.stopRunning()
            //don't do anything with the string value if it is nil
            if metadataObj.stringValue != nil {
                // This is what we got from the scan
                let myMessage = metadataObj.stringValue
                // Instantiate the view controller like we do in a tableview without prepare method
                let machineVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "machine_view_controller") as! MachineViewController
                // Go to the machine index that equals what we were scanning. Guarded so if it doesn't find the value it goes to else
                guard let machineIndex = myMachines.index(where: { (item) -> Bool in
                    item.name == myMessage
                })else{
                    //it will restart the capture session so we can try to scan again or scan something else
                    self.captureSession?.startRunning()
                    return
                }
                //set the VC's machine
                machineVC.machine = myMachines[machineIndex]
                // go to the Machines VC
                self.navigationController?.pushViewController(machineVC, animated: true)
                
                
            }
        }
        
    }
    
}

