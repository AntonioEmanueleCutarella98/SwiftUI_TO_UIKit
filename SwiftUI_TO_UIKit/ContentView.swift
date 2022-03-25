//
//  ContentView.swift
//  SwiftUI_TO_UIKit
//
//  Created by Antonio Emanuele Cutarella on 24/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var image: Image? = Image(systemName: "photo.circle")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentCamera = false
    
    var body: some View {

        NavigationView {
            VStack{
                Text("Click on the image in the circle to add your photo!")
                    .padding(.leading,27)
                    .padding(.top,-150)
            
                image!
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
                .onTapGesture { self.shouldPresentActionSheet = true }
                .sheet(isPresented: $shouldPresentImagePicker) {
                    SUImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, isPresented: self.$shouldPresentImagePicker)
            }.actionSheet(isPresented: $shouldPresentActionSheet) { () -> ActionSheet in
                ActionSheet(title: Text("Choose mode"), message: Text("Please choose your preferred mode to set your photo"), buttons: [ActionSheet.Button.default(Text("Camera"), action: {
                    self.shouldPresentImagePicker = true
                    self.shouldPresentCamera = true
                }), ActionSheet.Button.default(Text("Photo Library"), action: {
                    self.shouldPresentImagePicker = true
                    self.shouldPresentCamera = false
                }), ActionSheet.Button.cancel()])
            }
            .navigationTitle("Photo Displayer")
        }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
