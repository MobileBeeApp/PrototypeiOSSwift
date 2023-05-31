//
//  FlyerBuilderViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit

class FlyerBuilderViewController: UIViewController{

    @IBOutlet weak var textEntry: UITextField!

    @IBOutlet weak var bodyTextView: UITextView!

    @IBOutlet weak var imagePreview: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        // Add the share icon and action
//        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction))
//        self.toolbarItems?.append(shareButton)


//        // Add responder for keyboards to dismiss when tap or drag outside of text fields
//        scrollView.addGestureRecognizer(UITapGestureRecognizer(target: scrollView, action: #selector(UIView.endEditing(_:))))
//        scrollView.keyboardDismissMode = .onDrag
//      }
    }

    @IBAction func shareButtonTouched(_ sender: UIBarButtonItem) {
        guard
          let title = textEntry.text,
          let body = bodyTextView.text,
          let image = imagePreview.image
          else {
            let alert = UIAlertController(title: "All Information Not Provided", message: "You must write something in both text fields and add an image to preview/create an pdf for now...", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        let pdfCreator = PDFCreator(title: title, body: body, image: image)
        let pdfData = pdfCreator.createFlyer()
        let vc = UIActivityViewController(activityItems: [pdfData], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }

    @IBAction func selectImageTouched(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Select Photo", message: "Where do you want to select a photo?", preferredStyle: .actionSheet)

        let photoAction = UIAlertAction(title: "Photos", style: .default) { (action) in
          if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let photoPicker = UIImagePickerController()
            photoPicker.delegate = self
            photoPicker.sourceType = .photoLibrary
            photoPicker.allowsEditing = false

            self.present(photoPicker, animated: true, completion: nil)
          }
        }
        actionSheet.addAction(photoAction)

        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
          if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.sourceType = .camera

            self.present(cameraPicker, animated: true, completion: nil)
          }
        }
        actionSheet.addAction(cameraAction)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheet.addAction(cancelAction)

        self.present(actionSheet, animated: true, completion: nil)
    }





    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
      if
        let _ = textEntry.text,
        let _ = bodyTextView.text,
        let _ = imagePreview.image{
          return true
        }

      let alert = UIAlertController(
        title: "All Information Not Provided",
        message: "You must write something in both text fields and add an image to preview/create an pdf for now...",
        preferredStyle: .alert
      )
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alert, animated: true, completion: nil)

      return false
    }




    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "previewSegue" {
        guard let vc = segue.destination as? PDFPreviewViewController else { return }

        if let title = textEntry.text, let body = bodyTextView.text,
          let image = imagePreview.image {
          let pdfCreator = PDFCreator(title: title, body: body,
                                      image: image)
          vc.documentData = pdfCreator.createFlyer()
        }
      }
    }
  }


extension FlyerBuilderViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

    guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      return
    }

    imagePreview.image = selectedImage
    imagePreview.isHidden = false

    dismiss(animated: true, completion: nil)
  }
}

extension FlyerBuilderViewController: UINavigationControllerDelegate {
  // Not used, but necessary for compilation
}
