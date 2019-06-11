//
//  MicroBloggingAppTests.swift
//  MicroBloggingAppTests
//
//  Created by Matthieu PASCAUD on 5/22/19.
//  Copyright © 2019 Matthieu PASCAUD. All rights reserved.
//

import XCTest
import UIKit
@testable import MicroBloggingApp

class MicroBloggingAppTests: XCTestCase {
    
    var authorVC: AuthorTableViewController!
    //var authors: [Author]

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        authorVC = storyboard.instantiateViewController(withIdentifier: "authorViewControllerID") as? AuthorTableViewController
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        authorVC = nil
    }

    func testAuthorVCNoAuthor() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        //let uiBackgroundView = authorVC.tableView.backgroundView as! UILabel
        //XCTAssertEqual(uiBackgroundView.text, "Loading data...", "Text should be the same")
    }
    
    func testAPICallAuthor() {
        let queryString: String = "_limit=50"
        let authorsResource = AuthorsResource(query: queryString)
        let authorsRequest = ApiRequest(resource: authorsResource)
        authorsRequest.load { [weak self] (authorsList) in
            guard let listAuth = authorsList else {
                //error or no authors
                XCTFail()
                return
            }
            XCTAssertNotNil(listAuth)
        }
    }
    
    
    func test() {
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            authorVC.fetchAuthors()
        }
    }

}
