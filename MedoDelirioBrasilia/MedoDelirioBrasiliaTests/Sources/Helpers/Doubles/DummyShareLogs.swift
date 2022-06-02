@testable import Medo_e_Delírio
import Foundation

class DummyShareLogs {

    private static let installId = "76BE9811-D3D6-4DFC-8B37-6A8B83A1DF9A"
    
    private static let naoFodeMermaoContentId = "1432E4A4-2D05-4439-936E-143E4B7E89B3"
    private static let comunistaContentId = "599E91CD-DDA1-44AA-B3A9-C295397F3103"
    private static let deuErradoContentId = "131CBD3E-982E-4D9E-9D4A-8493DC6A14EC"
    private static let bomDiaContentId = "19CAEBDD-2B29-48C9-943B-18535A6E82BC"
    private static let euNaoErreiNenhumaContentId = "2E0B04FF-DB2B-4872-836A-40C61B7A5896"
    private static let naoVamosFalarDePornoAquiNaoContentId = "301B1EB5-1D6D-4AF1-8E8D-6CFBD9E95569"
    private static let eMentiraContentId = "82141C49-8622-49CD-A64A-CA94FB7FCBAF"
    
    static func getTwelveNaoFodeMermaoSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...11 {
            result.append(ShareLog(installId: installId, contentId: naoFodeMermaoContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getThirtyEightComunistaSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...37 {
            result.append(ShareLog(installId: installId, contentId: comunistaContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getFortyFourDeuErradoSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...43 {
            result.append(ShareLog(installId: installId, contentId: deuErradoContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getFortySixBomDiaSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...45 {
            result.append(ShareLog(installId: installId, contentId: bomDiaContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getSixtySixEuNaoErreiNenhumaSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...65 {
            result.append(ShareLog(installId: installId, contentId: euNaoErreiNenhumaContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getSeventySixNaoVamosFalarSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...75 {
            result.append(ShareLog(installId: installId, contentId: naoVamosFalarDePornoAquiNaoContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }
    
    static func getFortyTwoEMentiraSoundShareLogs() -> [ShareLog] {
        var result = [ShareLog]()
        for _ in 0...41 {
            result.append(ShareLog(installId: installId, contentId: eMentiraContentId, contentType: 0, dateTime: Date(), destination: 0, destinationBundleId: .empty))
        }
        return result
    }

}
