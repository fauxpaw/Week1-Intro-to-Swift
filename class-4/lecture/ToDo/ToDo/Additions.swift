//
//  Additions.swift
//  ToDo
//
//  Created by Michael Sweeney on 6/9/16.
//  Copyright © 2016 Michael Babiy. All rights reserved.
//

import Foundation

enum ArchiveComponent : String
{
    
    case Default = "Archives"
}


extension String {
    
//    static func archivePath(component: ArchiveComponent) -> String
//    {
//        return NSString(string: NSHomeDirectory()).stringByAppendingPathComponent(component.rawValue)
//    }

    static func archivePath(component: ArchiveComponent) -> String
    {
        return NSString(string: NSHomeDirectory()).stringByAppendingPathComponent(component.rawValue)
    }
}
