//
//  PDFCreator.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
import PDFKit
class PDFCreator: NSObject {
    
    let title: String
    let body: String
    let image: UIImage
    
    
    init(title: String, body: String, image: UIImage) {
        self.title = title
        self.body = body
        self.image = image
    }
    
    
    
    func createFlyer() -> Data {
      let pdfMetaData = [
        kCGPDFContextCreator: "Master Thesis",
        kCGPDFContextAuthor: "EP",
        kCGPDFContextTitle: title
      ]
      let format = UIGraphicsPDFRendererFormat()
      format.documentInfo = pdfMetaData as [String: Any]

      let pageWidth = 8.5 * 72.0
      let pageHeight = 11 * 72.0
      let pageRect = CGRect(x: 0, y: 0, width: pageWidth, height: pageHeight)

      let renderer = UIGraphicsPDFRenderer(bounds: pageRect, format: format)

      let data = renderer.pdfData { (context) in

        context.beginPage()

        //add title
        let titleBottom = addTitle(pageRect: pageRect)
        
        //add image
        let imageBottom = addImage(pageRect: pageRect, imageTop: titleBottom + 18.0)
        //add body text
        addBodyText(pageRect: pageRect, textTop: imageBottom + 18.0)
        addTempString(pageRect: pageRect, textTop: imageBottom + 32.0)
        //add drawing
        let context = context.cgContext
        drawTearOffs(context, pageRect: pageRect, tearOffY: pageRect.height * 4.0 / 5.0,
                     numberTabs: 8)
      }

      return data
    }
    
    //head
    func addTitle(pageRect: CGRect) -> CGFloat {
      let titleFont = UIFont.systemFont(ofSize: 18.0, weight: .bold)
      let titleAttributes: [NSAttributedString.Key: Any] =
        [NSAttributedString.Key.font: titleFont]

      let attributedTitle = NSAttributedString(
        string: title,
        attributes: titleAttributes
      )

      let titleStringSize = attributedTitle.size()

      let titleStringRect = CGRect(
        x: (pageRect.width - titleStringSize.width) / 2.0,
        y: 36,
        width: titleStringSize.width,
        height: titleStringSize.height
      )

      attributedTitle.draw(in: titleStringRect)

      return titleStringRect.origin.y + titleStringRect.size.height
    }
    
    //body
    func addBodyText(pageRect: CGRect, textTop: CGFloat) {
      let textFont = UIFont.systemFont(ofSize: 12.0, weight: .regular)
      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping
      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: body,
        attributes: textAttributes
      )

      let textRect = CGRect(
        x: 10,
        y: textTop,
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    
    
    //add tempString
    func addTempString(pageRect: CGRect, textTop: CGFloat) {
        let textFont = UIFont.systemFont(ofSize: 12.0, weight: .heavy)

      let paragraphStyle = NSMutableParagraphStyle()
      paragraphStyle.alignment = .natural
      paragraphStyle.lineBreakMode = .byWordWrapping

      let textAttributes = [
        NSAttributedString.Key.paragraphStyle: paragraphStyle,
        NSAttributedString.Key.font: textFont
      ]
      let attributedText = NSAttributedString(
        string: "Info from the developer: This pdf view is still in progress. I'm looking forward to your feedback on how your Beekeeper Journal should look like. :)",
        attributes: textAttributes
      )

      let textRect = CGRect(
        x: 10,
        y: 400,
        width: pageRect.width - 20,
        height: pageRect.height - textTop - pageRect.height / 5.0
      )
      attributedText.draw(in: textRect)
    }
    func addImage(pageRect: CGRect, imageTop: CGFloat) -> CGFloat {

      let maxHeight = pageRect.height * 0.4
      let maxWidth = pageRect.width * 0.8

      let aspectWidth = maxWidth / image.size.width
      let aspectHeight = maxHeight / image.size.height
      let aspectRatio = min(aspectWidth, aspectHeight)

      let scaledWidth = image.size.width * aspectRatio
      let scaledHeight = image.size.height * aspectRatio

      let imageX = (pageRect.width - scaledWidth) / 2.0
      let imageRect = CGRect(x: imageX, y: imageTop,
                             width: scaledWidth, height: scaledHeight)

      image.draw(in: imageRect)
      return imageRect.origin.y + imageRect.size.height
    }
    
    
    func drawTearOffs(_ drawContext: CGContext, pageRect: CGRect,
                      tearOffY: CGFloat, numberTabs: Int) {

      drawContext.saveGState()
      drawContext.setLineWidth(2.0)
      drawContext.move(to: CGPoint(x: 0, y: tearOffY))
      drawContext.addLine(to: CGPoint(x: pageRect.width, y: tearOffY))
      drawContext.strokePath()
      drawContext.restoreGState()
      drawContext.saveGState()
      let dashLength = CGFloat(72.0 * 0.2)
      drawContext.setLineDash(phase: 0, lengths: [dashLength, dashLength])

      let tabWidth = pageRect.width / CGFloat(numberTabs)
      for tearOffIndex in 1..<numberTabs {

        let tabX = CGFloat(tearOffIndex) * tabWidth
        drawContext.move(to: CGPoint(x: tabX, y: tearOffY))
        drawContext.addLine(to: CGPoint(x: tabX, y: pageRect.height))
        drawContext.strokePath()
      }
      drawContext.restoreGState()
    }
}
