import MixboxUiTestsFoundation
import MixboxFoundation
import XCTest

final class RecordingNetworkPlayerTests: BaseNetworkMockingTestCase {
    private lazy var recordedNetworkSessionFile = fileSystem.temporaryFile()
    
    private lazy var recordingPlayer = RecordingNetworkPlayer(
        networkRecordsProvider: networking.recording,
        networkRecorderLifecycle: networking.recording,
        testFailureRecorder: testCaseUtils.testFailureRecorder,
        recordedNetworkSessionPath: recordedNetworkSessionFile.path
    )
    
    private func file(contents: String) -> TemporaryFile {
        let file = fileSystem
            .temporaryFile()
            .withContents(string: contents)
        
        return file
    }
    
    func test_checkpoint_insertsIdToItself() {
        // Given
        let player = recordingPlayer
        
        networking.recording.startRecording()
        openScreen(name: screen.view)
        
        let sourceCodeFile = file(contents: ".checkpoint()")
        
        // When
        assertFailsInRecordingMode {
            player.checkpointImpl(
                id: nil,
                fileLine: RuntimeFileLine(
                    file: sourceCodeFile.path,
                    line: 1
                )
            )
        }
        
        // Then
        let regularExpressionForInsertedIdIntoFunction = "\\.checkpoint\\(id: \".+?\"\\)"
        assert(
            contentsOfFile: sourceCodeFile,
            matchesRegularExpression: regularExpressionForInsertedIdIntoFunction
        )
    }
    
    private func assert(contentsOfFile file: TemporaryFile, matchesRegularExpression regularExpression: String) {
        guard let contents = file.contents else {
            XCTFail("file.contents == nil")
            return
        }
        
        assert(
            value: contents,
            matches: RegularExpressionMatcher(
                regularExpression: regularExpression
            )
        )
    }
}
