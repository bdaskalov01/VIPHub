//
//  APITests.swift
//  VIPHubTests
//
//  Created by Eleanor on 3.09.24.
//

import XCTest
@testable import VIPHub

final class APITests: XCTestCase {

    var usersView: UsersView?
    var detailsView: DetailsView?
    var globalState: GlobalState = GlobalState().getInstance()
    var usersCache: UsersCacheProtocol?
    var detailsCache: UserDetailsCacheProtocol?
    
    @MainActor override func setUp() {
        usersView = ContentView().UsersView()
        detailsView = usersView?.constructDetailsView()
        globalState = GlobalState().newInstance()
        usersCache?.resetCache()
        detailsCache?.resetCache()
    }

    @MainActor
    override func tearDown() {
        usersView = nil
        detailsView = nil
    }
    
    func testCheckIfUsersAreFetched() async throws{
        
        let key: String = "234"
        
        XCTAssertNil(globalState.users)
        try await usersView!.interactor!.displayData(input: key)
        XCTAssertNotNil(globalState.users)
    }
    
    func testCheckIfUsersNextPagesAreFetched() async throws{
        
        let key: String = "123"
        
        XCTAssertEqual(nil, globalState.users?.count)
        try await usersView!.interactor!.displayData(input: key)
        XCTAssertEqual(30, globalState.users?.count)
        try await usersView!.interactor!.displayData(input: key)
        XCTAssertEqual(60, globalState.users?.count)
    }

    func testCheckIfDetailsAreFetched() async throws {
        
        let key: String = "27384"
        
        XCTAssertNil(globalState.details)
        try await detailsView!.interactor!.displayUserDetails(id: key)
        XCTAssertNotNil(globalState.details)
    }
    
    func testCheckIfEndIsReached() async throws {
        
        let key: String = "daskalov"
        for _ in 0...10 {
            try await usersView!.interactor!.displayData(input: key)
        }

        XCTAssertEqual("End has been reached.", globalState.error)
    }
    
    func testCheckIfNoUsersFound() async throws {
        
        let key: String = "rw9fh247fh4327f347842374y234723"
        try await usersView!.interactor!.displayData(input: key)
        

        XCTAssertEqual("No users found.", globalState.error)
    }
    
    func testCheckIfInputIsEmpty() async throws {
        
        let key: String = ""
        try await usersView!.interactor!.displayData(input: key)
        

        XCTAssertEqual("Empty input.", globalState.error)
    }



}
