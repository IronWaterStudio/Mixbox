import MixboxUiTestsFoundation
import XCTest

final class FailuresTests: TestCase {
    override func precondition() {
        openScreen(name: "FailuresTestsView")
    }
    
    func test_multipleMatchesFailure() {
        assertFails(expected: true) { fails in
            pageObjects.screen.view.withTimeout(1).assert.isDisplayed(file: "fallback", line: 1); fails.here()
        }
    }
    
    func test_whenCallingFromTest() {
        assertFails(description: "failed - message", expected: true) { fails in
            XCTFail("message", file: "fallback", line: 1); fails.here()
        }
    }
    
    // TODO: XCTFail doesn't work from background, but we can test our TestFailureRecorder
    func disabled_test_whenCallingFromBackground() {
        assertFails(description: "failed - message") { fails in
            let background = DispatchQueue(label: "background")
            let dispatchGroup = DispatchGroup()
            dispatchGroup.enter()
            background.async {
                XCTAssert(Thread.current != Thread.main, "Test is not configured properly")
                XCTFail("message", file: "fallback", line: 1); fails.here()
                dispatchGroup.leave()
            }
            dispatchGroup.wait()
        }
    }
    
    func test_parametrizedTest() {
        assertFails(description: "failed - message", expected: true) { fails in
            XCTFail("message", file: "fallback", line: 1); fails.here()
        }
        
        parametrizedTest(message: "message")
        parametrizedTest(message: "other message")
    }
    
    func parametrizedTest(message: String) {
        assertFails(description: "failed - \(message)", expected: true) { fails in
            XCTFail(message, file: "fallback", line: 1); fails.here()
        }
        
        assertFails(description: "failed - message", expected: true) { fails in
            functionWithNameOtherThanTestOrParametrizedTest(); fails.here()
        }
    }
    
    func functionWithNameOtherThanTestOrParametrizedTest() {
        // The following line will not be highlighted, because hightlighting is configured to
        // highlight only "test" and "parametrizedTest" functions
        XCTFail("message", file: "fallback", line: 1)
    }
}

private final class Screen: BasePageObjectWithDefaultInitializer {
    var view: ViewElement {
        return element("view") {
            $0.id == "view"
        }
    }
}

private extension PageObjects {
    var screen: Screen {
        return pageObject()
    }
}