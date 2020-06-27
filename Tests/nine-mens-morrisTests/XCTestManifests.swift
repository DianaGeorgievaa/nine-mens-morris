import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(nine_mens_morrisTests.allTests),
    ]
}
#endif
