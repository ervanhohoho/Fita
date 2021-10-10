//
//  Fita_MusicTests.swift
//  Fita-MusicTests
//
//  Created by Ervan Dharmawan on 10/10/21.
//

import XCTest
@testable import Fita_Music
let resultString = """
{ "resultCount": 5,
"results":
[{"wrapperType":"track", "kind":"song", "artistId":909253, "collectionId":1469577723, "trackId":1469577741, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackName":"Upside Down", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackCensoredName":"Upside Down", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4", "trackViewUrl":"https://music.apple.com/us/album/upside-down/1469577723?i=1469577741&uo=4",
"previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/5e/5b/3d/5e5b3df4-deb5-da78-5d64-fe51d8404d5c/mzaf_13341178261601361485.plus.aac.p.m4a", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "trackPrice":1.29, "releaseDate":"2005-01-01T12:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":14, "trackNumber":1, "trackTimeMillis":208643, "country":"USA", "currency":"USD", "primaryGenreName":"Rock", "isStreamable":true},
{"wrapperType":"track", "kind":"song", "artistId":909253, "collectionId":1469577723, "trackId":1469577808, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackName":"Broken", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackCensoredName":"Broken", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/broken/1469577723?i=1469577808&uo=4", "trackViewUrl":"https://music.apple.com/us/album/broken/1469577723?i=1469577808&uo=4",
"previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/8b/fd/81/8bfd81a6-0217-b56c-01b0-7249ed910a35/mzaf_16218415284344588014.plus.aac.p.m4a", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "trackPrice":1.29, "releaseDate":"2006-02-07T12:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":14, "trackNumber":2, "trackTimeMillis":234746, "country":"USA", "currency":"USD", "primaryGenreName":"Rock", "isStreamable":true},
{"wrapperType":"track", "kind":"song", "artistId":909253, "collectionId":1469577723, "trackId":1469577830, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackName":"We're Going To Be Friends", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackCensoredName":"We're Going To Be Friends", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/were-going-to-be-friends/1469577723?i=1469577830&uo=4", "trackViewUrl":"https://music.apple.com/us/album/were-going-to-be-friends/1469577723?i=1469577830&uo=4",
"previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/ce/48/5b/ce485b59-13b7-9859-0431-e602d6347479/mzaf_7168871676263777717.plus.aac.p.m4a", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "trackPrice":1.29, "releaseDate":"2005-01-01T12:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":14, "trackNumber":7, "trackTimeMillis":137533, "country":"USA", "currency":"USD", "primaryGenreName":"Rock", "isStreamable":true},
{"wrapperType":"track", "kind":"song", "artistId":909253, "collectionId":1469577723, "trackId":1469578000, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackName":"My Own Two Hands (feat. Ben Harper)", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackCensoredName":"My Own Two Hands (feat. Ben Harper)", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/my-own-two-hands-feat-ben-harper/1469577723?i=1469578000&uo=4", "trackViewUrl":"https://music.apple.com/us/album/my-own-two-hands-feat-ben-harper/1469577723?i=1469578000&uo=4",
"previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/0d/1b/1a/0d1b1a37-2068-0e62-2162-0c9822fbc03c/mzaf_4390099184106020569.plus.aac.p.m4a", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "trackPrice":1.29, "releaseDate":"2005-01-01T12:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":14, "trackNumber":11, "trackTimeMillis":178360, "country":"USA", "currency":"USD", "primaryGenreName":"Rock", "isStreamable":true},
{"wrapperType":"track", "kind":"song", "artistId":909253, "collectionId":1469577723, "trackId":1469577820, "artistName":"Jack Johnson", "collectionName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackName":"Talk of the Town (feat. Kawika Kahiapo)", "collectionCensoredName":"Jack Johnson and Friends: Sing-A-Longs and Lullabies for the Film Curious George", "trackCensoredName":"Talk of the Town (feat. Kawika Kahiapo)", "artistViewUrl":"https://music.apple.com/us/artist/jack-johnson/909253?uo=4", "collectionViewUrl":"https://music.apple.com/us/album/talk-of-the-town-feat-kawika-kahiapo/1469577723?i=1469577820&uo=4", "trackViewUrl":"https://music.apple.com/us/album/talk-of-the-town-feat-kawika-kahiapo/1469577723?i=1469577820&uo=4",
"previewUrl":"https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/9b/a3/4a/9ba34a84-7fd7-cf0d-63fb-527589bba29d/mzaf_10309152793486182212.plus.aac.p.m4a", "artworkUrl30":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/30x30bb.jpg", "artworkUrl60":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/60x60bb.jpg", "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg", "collectionPrice":9.99, "trackPrice":1.29, "releaseDate":"2005-01-01T12:00:00Z", "collectionExplicitness":"notExplicit", "trackExplicitness":"notExplicit", "discCount":1, "discNumber":1, "trackCount":14, "trackNumber":5, "trackTimeMillis":202359, "country":"USA", "currency":"USD", "primaryGenreName":"Rock", "isStreamable":true}]}

"""
class MockMusicAPI: MusicAPI{
    
    func searchByQuery(query: String, completion: @escaping (Result<QueryResultModel, Error>) -> Void) {
        if query == "success"{
            do {
                let result = try JSONDecoder().decode(QueryResultModel.self, from: resultString.data(using: .utf8)!)
                completion(.success(result))
            } catch{
                debugPrint(error)
            }
        } else {
            completion(.failure(NSError()))
        }
    }
    
    
}
class Fita_MusicTests: XCTestCase {
    var homeVC: HomeVC!
    override func setUpWithError() throws {
        homeVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        homeVC.loadView()
        homeVC.musicAPI = MockMusicAPI()
    }

    override func tearDownWithError() throws {
    }

    func testQuerySuccess() throws {
        homeVC.searchText = "success"
        let expectation = self.expectation(description: "apiCall")
        homeVC.apiCall {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(homeVC.tracks.count == 5)
    }

    func testQueryFailure() throws {
        homeVC.searchText = "failure"
        let expectation = self.expectation(description: "apiCall")
        homeVC.apiCall {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertTrue(homeVC.tracks.count == 0)
    }

}
