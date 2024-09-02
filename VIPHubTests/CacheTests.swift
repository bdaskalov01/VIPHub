//
//  CacheTests.swift
//  VIPHubTests
//
//  Created by Eleanor on 3.09.24.
//

import XCTest
@testable import VIPHub

final class CacheTests: XCTestCase {

    var usersView: UsersView?
    var detailsView: DetailsView?
    var usersCache: UsersCacheProtocol?
    var detailsCache: UserDetailsCacheProtocol?
    var globalState: GlobalState = GlobalState().getInstance()
    
    @MainActor
    override func setUp() {
        usersView = ContentView().UsersView()
        detailsView = usersView?.constructDetailsView()
        usersCache = UsersCache()
        detailsCache = UserDetailsCache()
        usersCache?.resetCache()
        detailsCache?.resetCache()
        globalState = GlobalState().newInstance()

    }

    @MainActor
    override func tearDown() {
        usersView = nil
        detailsView = nil
        usersCache = nil
        detailsCache = nil
        usersCache?.resetCache()
        detailsCache?.resetCache()
    }

    func testCheckIfUserIsStored() async throws {
        
        let key: String = "asd"
        
        do {
            _ = try await usersView!.interactor!.displayData(input: key)

        }
        catch let error{
                print(error)
        }
        
        print(usersCache!.getArray(forKey: key))
        XCTAssertNotNil(usersCache!.getArray(forKey: key))
    }
    
    func testCheckIfUserIsNotStored() async throws {
        
        let key: String = "validKey"
        let otherKey: String = "unvalidKey"

        _ = try await usersView!.interactor!.displayData(input: key)
                
        print(usersCache!.getArray(forKey: otherKey))
              
        XCTAssertNil(usersCache?.getArray(forKey: otherKey))
    }
    
    func testCheckIfUserIsDeleted() async throws {
        
        let key: String = "user"
        
        _ = try await usersView!.interactor!.displayData(input: key)
            
        XCTAssertNotNil(usersCache?.getArray(forKey: key))
        
        usersCache?.removeArray(forKey: key)
        
        XCTAssertNil(usersCache?.getArray(forKey: key))
    }
    
    func testCheckIfCacheIsReset() async throws {
        
        let key: String = "user"
        let anotherKey: String = "123"
        
        _ = try await usersView!.interactor!.displayData(input: key)
        
        _ = try await usersView!.interactor!.displayData(input: anotherKey)
            
        XCTAssertEqual(2, usersCache?.getCount())
        
        usersCache?.resetCache()
        
        XCTAssertEqual(0, usersCache?.getCount())

    }

}
