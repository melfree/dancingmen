//
//  DataManager.swift
//  DancingMen
//
//  Created by Melanie Freeman on 12/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

class DataManager {
    
    var fontManager = FontManager()
    
    init () {
        load()
    }
    
    func load() {
        let path = dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            if let data = NSData(contentsOfFile: path) {
                let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                self.fontManager = unarchiver.decodeObjectForKey("FontManager") as! FontManager
                unarchiver.finishDecoding()
            }
        }
    }
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as! [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("DancingMen.plist")
    }
    
    func save() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        archiver.encodeObject(fontManager, forKey: "FontManager")
        archiver.finishEncoding()
        data.writeToFile(dataFilePath(), atomically: true)
    }
}
