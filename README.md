# SwiftUI_TO_UIKit

UIKit to SwiftUI Integration

To integrate UIViews and UIViewControllers from UIKit with SwiftUI I needed to use what are called UIViewRepresentable and UIViewControllerRepresentable protocols.
- The UIViewRepresentable protocol is used to integrate UIKit views with SwiftUI.
- The UIViewControllerRepresentable protocol is used to integrate UIKit ViewControllers with SwiftUI.


I used UIViewControllerRepresentable to integrate UIImagePickerController (which is a ViewController in UIKit) with SwiftUI for accessing photos from the photo library or capturing a live photo from the camera on the iPhone.

I have declared a property to mention the sourceType of the PickerController and two binding properties to notify the view which initialized the SUImagePickerView as soon as the user chooses the image or cancels.

The @Binding property wrapper is used to share common data between different views.

I declared one more optional method in this protocol which is called makeCoordinator(); the coordinator manages communication between the ViewController’s targets, actions, delegates, etc.
ViewController initialization logics will go inside the makeUIViewController() method. I initialized UIImagePickerController in this method with proper sourceType and setting the delegate as coordinator. 

This is our custom coordinator that is going to manage the image picker delegates and return the initialized image picker controller.

I needed to update the instance of the initialized ViewController in the updateUIViewController() method whenever asked by SwiftUI to render the view on the screen to respond to state changes (even if this app doesn’t need this function, we still need to declare it with nothing inside of it to be able to run it).
