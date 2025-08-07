//
//  LocalizedBundle.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 07.08.2025.
//

//import Foundation
//
//private var bundleKey: UInt8 = 0
//
//final class LocalizedBundle: Bundle {
//    override var localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
//        let bundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle ?? self
//        return bundle.localizedString(forKey: key, value: value, table: tableName)
//    }
//}
//
//extension Bundle {
//    static let once: Void = {
//        object_setClass(Bundle.main, LocalizedBundle.self)
//    }()
//    
//    static let setLanguage(_ language: String) {
//        Bundle.once
//        let isSystem = language.isEmpty
//        let path = isSystem ? nil : Bundle.main.path(forResource: language, ofType: "lproj")
//        let bundle = path.flatMap(Bundle.init(path:))
//        objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
//}


import Foundation

private var bundleKey: UInt8 = 0

final class LocalizedBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let currentBundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle ?? self
        return currentBundle.localizedString(forKey: key, value: value, table: tableName)
    }
}

extension Bundle {
    static let once: Void = {
        object_setClass(Bundle.main, LocalizedBundle.self)
    }()

    static func setLanguage(_ language: String) {
        Bundle.once

        let isSystem = language.isEmpty
        let lang = isSystem ? Locale.preferredLanguages.first ?? "en" : language

        guard
            let path = Bundle.main.path(forResource: lang, ofType: "lproj"),
            let langBundle = Bundle(path: path)
        else {
            return
        }

        objc_setAssociatedObject(Bundle.main, &bundleKey, langBundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
