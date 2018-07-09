//
//  DragView.swift
//  ImageToUploads.Im
//
//  Created by 1Doc Tecnologia on 09/07/18.
//  Copyright © 2018 Fernando Paladini. All rights reserved.
//

import Cocoa

class DragView: NSView {

    // Variables
    private var fileTypeIsOk = false
    private var acceptedFileExtensions = ["jpg"]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerForDraggedTypes([NSPasteboard.PasteboardType
            .fileNameType(forPathExtension: ".jpg")])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    // Dragging methods
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        fileTypeIsOk = checkExtension(drag: sender)
        return []
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy : []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let draggedFileURL = sender.draggedFileURL else {
            return false
        }
        
        return true
    }
    
    fileprivate func checkExtension(drag: NSDraggingInfo) -> Bool {
        guard let fileExtension = drag.draggedFileURL?.pathExtension?.lowercased() else {
            return false
        }
        
        return acceptedFileExtensions.contains(fileExtension)
    }
    
}

extension NSDraggingInfo {
    var draggedFileURL: NSURL? {
        let filenames = draggingPasteboard().propertyList(forType: NSFilenamesPboardType) as? [String]
        let path = filenames?.first
        
        return path.map(NSURL.init)
    }
}
