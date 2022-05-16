//
//  PhotoPicker.swift
//  recookApp
//
//  Created by Jessica Wienadi on 28/03/22.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var images: Data
    @Binding var show: Bool
    
    
    var sourceType : UIImagePickerController.SourceType = .photoLibrary

    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(img1: self)
    }
    
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let picker = UIImagePickerController()
//            picker.allowsEditing = true
        picker.sourceType = sourceType
            
            //Now lets fetch the images
            //If you forget to connect them, you will never see a photo appearing on your app, so dont forget this
            picker.delegate = context.coordinator
        
        return picker
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
        //
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var img0 : ImagePicker
        init(img1: ImagePicker) {
            img0 = img1
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //If you call the ImagePicker and then decided to dont pick any pic, by only push cancel
            self.img0.show.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
//            let image = info[.editedImage] as? UIImage
            let image = info[.originalImage] as? UIImage
            
            //Ths will send the photo to our app with good quality if you want it, only change the amoung on [ (compressionQuality: CGFloat) ]
            let data = image?.jpegData(compressionQuality: 0.6)
            
            self.img0.images = data!
            //When you click on the photo, the imagePickerView will dismiss asap
            self.img0.show.toggle()
        }
    }
}


