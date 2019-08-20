import UIKit
import CoreImage

let image = UIImage(named: "sample.png")!

let imageRGBA = RGBAImage.init(image: image)

if let pixels = imageRGBA {
    for y in 0..<pixels.height {
        for x in 0..<pixels.width {
            let  index = y * pixels.width + x
            var pixel = pixels.pixels[index]
            if pixel.Rf > 0.9 || pixel.Gf > 0.9 || pixel.Bf > 0.9 {
                // checked for white area
                // fill new color
                pixel.Rf = 0
                pixel.Gf = 1
                pixel.Bf = 0
                pixel.Af = 1
                imageRGBA?.pixels[index] = pixel
            }
        }
    }
}

let newImage = imageRGBA?.toUIImage()
