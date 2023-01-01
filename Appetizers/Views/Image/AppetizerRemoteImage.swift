//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Samed Dağlı on 1.01.2023.
//

import SwiftUI

final class ImageDownloader: ObservableObject {
    @Published var image: Image? = nil
    
    func downloadImage(from url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] uiImage in
            guard let self = self else { return }

            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageDownloader = ImageDownloader()
    let url: String
    
    var body: some View {
        RemoteImage(image: imageDownloader.image)
            .onAppear {
                imageDownloader.downloadImage(from: url)
            }
    }
}

