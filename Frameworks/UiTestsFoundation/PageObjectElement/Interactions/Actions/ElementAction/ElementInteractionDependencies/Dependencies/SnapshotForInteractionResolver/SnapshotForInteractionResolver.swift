// TODO: This particular interface should not exists or at least it should not duplicate other interfaces.
// However, we will need something like that to implement actions (ElementAction).
//
// It is a temporary workaround to pause current refactoring.
// Should be refactored further during implementation of Gray Box tests.
public protocol SnapshotForInteractionResolver {
    func resolve(
        minimalPercentageOfVisibleArea: CGFloat,
        completion: @escaping (ElementSnapshot) -> (InteractionResult))
        -> InteractionResult
}
