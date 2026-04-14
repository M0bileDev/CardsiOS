//
//  StickerModal.swift
//  Cards
//
//  Created by Damian Ogórek on 14/04/2026.
//

import SwiftUI

struct StickerModal: View {
    var body: some View {
        if let resourcePath = Bundle.main.resourcePath,
            let image = UIImage(
                named: resourcePath + "/Stickers/Camping/fire.png"
            )
        {
            Image(uiImage: image)
        } else {
            Image(.error)
        }
    }

    static func loadStickers() -> [String] {
        var themes: [URL] = []
        var stickerNames: [String] = []

        //default file manager
        let fileManager = FileManager.default
        //bundle resource path
        if let resourcePath = Bundle.main.resourcePath,
            //directory enumerator
            let enumerator = fileManager.enumerator(
                at: URL(fileURLWithPath: resourcePath + "/Stickers"),
                includingPropertiesForKeys: nil,
                options: [
                    .skipsSubdirectoryDescendants,
                    .skipsHiddenFiles,
                ]
            )
        {
            for case let url as URL in enumerator
            where url.hasDirectoryPath {
                themes.append(url)
            }
        }

        for theme in themes {
            if let files = try? fileManager.contentsOfDirectory(
                atPath: theme.path
            ) {
                for file in files {
                    stickerNames.append(theme.path + "/" + file)
                }
            }
        }

        return stickerNames
    }
}

func image(from path: String) -> UIImage {
    print("loading", NSString(string: path).lastPathComponent)
    return UIImage(named: path) ?? UIImage.error
}

#Preview {
    StickerModal()
}
