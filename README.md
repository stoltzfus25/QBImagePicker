# PLEASE NOTE, THIS PROJECT IS NO LONGER BEING MAINTAINED

This fork is to make the library compatible with Swift Package Manager.

Multi selection is now possible in PHPicker introduced in iOS 14. For more info, see https://developer.apple.com/videos/play/wwdc2020/10652/. This project should only be used to support multiple selection on iOS 13 and below.

# QBImagePicker

A clone of UIImagePickerController with multiple selection support.

![screenshot01.png](screenshot01.png)
![screenshot02.png](screenshot02.png)



## Features

- Allows multiple selection of photos and videos
- Fast and memory-efficient scrolling
- Provides similar user interface to the built-in image picker
- Customizable (grid size, navigation message, etc.)
- Supports both portrait mode and landscape mode
- Compatible with iPhone 6/6Plus, and iPad



## Requirements

- Version `>= 3.0.0` : iOS 8 or later (Using PhotoKit)
- Version `< 3.0.0` : iOS 6 or later (Using AssetsLibrary)



## Example

    QBImagePickerController *imagePickerController = [QBImagePickerController new];
    imagePickerController.delegate = self;
    imagePickerController.allowsMultipleSelection = YES;
    imagePickerController.maximumNumberOfSelection = 6;
    imagePickerController.showsNumberOfSelectedAssets = YES;

    [self presentViewController:imagePickerController animated:YES completion:NULL];



## Installation

### Swift Package Manager

You can use the [Swift Package Manager](https://swift.org/package-manager/) to install `QBImagePicker` by adding the proper description to your `Package.swift` file:

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/stoltzfus25/QBImagePicker.git", from: "4.0.0"),
    ]
)
```

## Usage

### Basic

1. Implement `QBImagePickerControllerDelegate` methods
2. Create `QBImagePickerController` object
3. Set `self` to the `delegate` property
4. Show the picker by using `presentViewController:animated:completion:`

    QBImagePickerController *imagePickerController = [QBImagePickerController new];
    imagePickerController.delegate = self;

    [self presentViewController:imagePickerController animated:YES completion:NULL];


### Delegate Methods

#### Getting the selected assets

Implement `qb_imagePickerController:didFinishPickingAssets:` to get the assets selected by the user.  
This method will be called when the user finishes picking assets.

    - (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didFinishPickingAssets:(NSArray *)assets {
        for (PHAsset *asset in assets) {
            // Do something with the asset
        }

        [self dismissViewControllerAnimated:YES completion:NULL];
    }


#### Getting notified when the user cancels

Implement `qb_imagePickerControllerDidCancel:` to get notified when the user hits "Cancel" button.

    - (void)qb_imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }


#### Getting notified when the selection is changed

You can handle the change of user's selection by implementing these methods.

    - (BOOL)qb_imagePickerController:(QBImagePickerController *)imagePickerController shouldSelectAsset:(PHAsset *)asset;
    - (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didSelectAsset:(PHAsset *)asset;
    - (void)qb_imagePickerController:(QBImagePickerController *)imagePickerController didDeselectAsset:(PHAsset *)asset;


### Customization

#### Selection mode

When `allowsMultipleSelection` is `YES`, the user can select multiple photos.  
The default value is `NO`.

    imagePickerController.allowsMultipleSelection = YES;

You can limit the number of selection by using `minimumNumberOfSelection` and `maximumNumberOfSelection` property.  
The default value is `0`, which means the number of selection is unlimited.

    imagePickerController.minimumNumberOfSelection = 3;
    imagePickerController.maximumNumberOfSelection = 6;


#### Specify the albums to be shown

Use `assetCollectionSubtypes` property to specify the albums to be shown.  
The code below shows the default value.

    imagePickerController.assetCollectionSubtypes = @[
        @(PHAssetCollectionSubtypeSmartAlbumUserLibrary), // Camera Roll
        @(PHAssetCollectionSubtypeAlbumMyPhotoStream), // My Photo Stream
        @(PHAssetCollectionSubtypeSmartAlbumPanoramas), // Panoramas
        @(PHAssetCollectionSubtypeSmartAlbumVideos), // Videos
        @(PHAssetCollectionSubtypeSmartAlbumBursts) // Bursts
    ];

The albums will be ordered as you specified.  
User's albums are always shown after the smart albums.


#### Specify the media type to be shown

Use `mediaType` to filter the assets to be shown.  
The default value is `QBImagePickerMediaTypeAny`.

    imagePickerController.mediaType = QBImagePickerMediaTypeVideo;


#### Showing information

There are some properties to show helpful information.

    imagePickerController.prompt = @"Select the photos you want to upload!";
    imagePickerController.showsNumberOfSelectedAssets = YES;


#### Grid size

Use `numberOfColumnsInPortrait` and `numberOfColumnsInLandscape` to change the grid size.  
The code below shows the default value.

    imagePickerController.numberOfColumnsInPortrait = 4;
    imagePickerController.numberOfColumnsInLandscape = 7;



## License

Copyright (c) 2015 Katsuma Tanaka

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
