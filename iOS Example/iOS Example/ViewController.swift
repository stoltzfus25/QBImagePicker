//
//  ViewController.swift
//  iOS Example
//
//  Created by Samuel Stoltzfus on 12/9/20.
//

import UIKit
import QBImagePicker

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imagePickerController = QBImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.mediaType = .any
        imagePickerController.allowsMultipleSelection = indexPath.section == 1
        imagePickerController.showsNumberOfSelectedAssets = true
        
        if indexPath.section == 1 {
            switch (indexPath.row) {
                case 1:
                    imagePickerController.minimumNumberOfSelection = 3
                case 2:
                    imagePickerController.maximumNumberOfSelection = 6
                case 3:
                    imagePickerController.minimumNumberOfSelection = 3
                    imagePickerController.maximumNumberOfSelection = 6
                case 4:
                    imagePickerController.maximumNumberOfSelection = 2
                    imagePickerController.selectedAssets.add(PHAsset.fetchAssets(with: nil).lastObject!)
                default: break
            }
        }

        present(imagePickerController, animated: true)
    }
}

extension ViewController: QBImagePickerControllerDelegate {
    func qb_imagePickerController(_ imagePickerController: QBImagePickerController!, didFinishPickingAssets assets: [Any]!) {
        NSLog("Selected assets:")
        NSLog("%@", assets)

        dismiss(animated: true)
    }
    
    func qb_imagePickerControllerDidCancel(_ imagePickerController: QBImagePickerController!) {
        NSLog("Canceled.")

        dismiss(animated: true)
    }
}
