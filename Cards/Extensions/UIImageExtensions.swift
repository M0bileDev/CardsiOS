//
//  UIImageExtensions.swift
//  Cards
//
//  Created by Damian Ogórek on 26/04/2026.
//

import SwiftUI
internal import UniformTypeIdentifiers

extension UIImage {
    static let minSize = CGSize(width: 300, height: 200)
    static let maxSize = CGSize(width: 1000, height: 1500)

    /**
     Deletes a PNG image file from the app's documents directory.
    
     It takes an optional file name, unwraps it, constructs the full file path by appending the .png extension to the documents directory, and then attempts to remove the file using FileManager.
    
     If the name is nil or the deletion fails, it silently does nothing (try?)
     */
    static func remove(name: String?) {
        if let name {
            let url = URL.documentsDirectory.appendingPathComponent(name)
                .appendingPathExtension(for: .png)
            try? FileManager.default.removeItem(at: url)
        }
    }

    func resizeLargeImage() -> UIImage {
        let defaultSize: CGFloat = 1000
        if size.width <= defaultSize || size.height <= defaultSize {
            return self
        }

        let scale: CGFloat
        if size.width >= size.height {
            scale = defaultSize / size.width
        } else {
            scale = defaultSize / size.height
        }

        let newSize = CGSize(
            width: size.width * scale,
            height: size.height * scale
        )
        return resize(to: newSize)
    }

    func resize(to size: CGSize) -> UIImage {
        let imageRendererFormat = UIGraphicsImageRendererFormat()
        //100×100 means 100×100 pixels, no multiplier
        imageRendererFormat.scale = 1
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat)
            .image(actions: { _ in
                draw(in: CGRect(origin: .zero, size: size))
            })
    }

    /**
     Helper that takes an image name, attempts to load it from the asset catalog via UIImage(named:), and if successful, returns
     the computed initialSize() (the aspect-ratio-preserving, clamped size from the previous method).
    
     If the image can't be found, it returns .zero as a fallback.
     */
    static func imageSize(_ imageName: String) -> CGSize {
        if let image = UIImage(named: imageName) {
            return image.initialSize()
        }

        return .zero
    }

    /**
     Calculates an initial display size for an element (likely an image) while preserving its original aspect ratio.
    
     It starts from a default size (Settings.defaultElementSize), then determines whether the element is landscape/square or portrait.
    
     For landscape, it clamps the width between 300 - 1000pt and derives the height from the aspect ratio.
     For portrait, it clamps the height between 200 - 1500pt and derives the width.
    
     The result is a CGSize that fits within the min/max bounds without distorting the content.
     */
    func initialSize() -> CGSize {
        var width = Settings.defaultElementSize.width
        var height = Settings.defaultElementSize.height

        if self.size.width >= self.size.height {
            width = max(Self.minSize.width, width)
            width = min(Self.maxSize.width, width)
            height = self.size.height * (width / self.size.width)
        } else {
            height = max(Self.minSize.height, height)
            height = min(Self.maxSize.height, height)
            width = self.size.width * (height / self.size.height)
        }

        return CGSize(width: width, height: height)
    }
}
