//
//  Path Control Port.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import SwiftUI

struct PathControl: NSViewRepresentable
{
    typealias NSViewType = NSPathControl

    let urlToShow: URL
    let style: NSPathControl.Style

    let width: CGFloat?

    func makeNSView(context _: Context) -> NSPathControl
    {
        let pathControl: NSPathControl = .init()

        pathControl.pathStyle = style
        pathControl.url = urlToShow

        if let width
        {
            pathControl.translatesAutoresizingMaskIntoConstraints = false
            pathControl.widthAnchor.constraint(lessThanOrEqualToConstant: width).isActive = true
        }

        return pathControl
    }

    func updateNSView(_: NSPathControl, context _: Context) {}

    func makeCoordinator() -> Coordinator
    {
        return Coordinator()
    }

    class Coordinator: NSObject, NSPathControlDelegate
    {
        // TODO: Implement this in the future
        /*
         var parent: PathControl

         init(parent: PathControl) {
             self.parent = parent
         }

         func pathControl(_ pathControl: NSPathControl, willDisplay openPanel: NSOpenPanel) {
             openPanel.allowsMultipleSelection = false
             openPanel.canChooseDirectories = false
             openPanel.allowedContentTypes = [.unixExecutable]

             openPanel.begin { result in
                 switch result
                 {
                     case .OK:
                         self.parent.urlToShow = openPanel.url!
                     default:
                         AppConstants.shared.logger.warning("Didn't select a proper Homebrew executable")
                 }
             }
         }
          */
    }
}
