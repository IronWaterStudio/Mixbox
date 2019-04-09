public final class WrappedDescriptionElementInteraction: ElementInteraction {
    public typealias DescriptionBuilder = (ElementInteractionDependencies) -> String
    
    private let interaction: ElementInteraction
    private let descriptionBuilder: DescriptionBuilder
    
    public init(
        interaction: ElementInteraction,
        descriptionBuilder: @escaping DescriptionBuilder)
    {
        self.interaction = interaction
        self.descriptionBuilder = descriptionBuilder
    }
    
    public func with(
        dependencies: ElementInteractionDependencies)
        -> ElementInteractionWithDependencies
    {
        return WithDependencies(
            dependencies: dependencies,
            interaction: interaction.with(
                dependencies: dependencies
            ),
            descriptionBuilder: descriptionBuilder
        )
    }
    
    public final class WithDependencies: ElementInteractionWithDependencies {
        private let dependencies: ElementInteractionDependencies
        private let interaction: ElementInteractionWithDependencies
        private let descriptionBuilder: DescriptionBuilder
        
        public init(
            dependencies: ElementInteractionDependencies,
            interaction: ElementInteractionWithDependencies,
            descriptionBuilder: @escaping DescriptionBuilder)
        {
            self.dependencies = dependencies
            self.interaction = interaction
            self.descriptionBuilder = descriptionBuilder
        }
        
        public func description() -> String {
            return descriptionBuilder(dependencies)
        }
        
        public func interactionFailureShouldStopTest() -> Bool {
            return interaction.interactionFailureShouldStopTest()
        }
        
        public func perform() -> InteractionResult {
            return interaction.perform()
        }
    }
}