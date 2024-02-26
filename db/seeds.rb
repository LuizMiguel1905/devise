Component.create!(
  componentName: "Kingston Hiper X",
  component_validation: ComponentValidation.find_by(componentType:"RAM")
)

ComponentValidation.create!(
  componentType: "RAM",
  component_attribute: ComponentAttribute.find_by(memory: 4)
)

ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 4
)
