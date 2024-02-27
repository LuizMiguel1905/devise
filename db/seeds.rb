
component_attribute1 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 4
)

component_attribute2 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 8
)

component_attribute3 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 16
)

component_attribute4 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 32
)

component_attribute5 = ComponentAttribute.create!(
  brand: 'Intel',
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: nil
)
component_attribute6 = ComponentAttribute.create!(
  brand: 'AMD',
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: nil
)

component_attribute7 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: 'Intel',
  isGPU: nil,
  memorySlot: 2,
  memoryLimit: 16,
  video: false,
  memory: nil
)

component_attribute8 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: 'AMD',
  isGPU: nil,
  memorySlot: 2,
  memoryLimit: 16,
  video: false,
  memory: nil
)

component_attribute9 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: 'BOTH',
  isGPU: nil,
  memorySlot: 4,
  memoryLimit: 64,
  video: true,
  memory: nil
)

component_attribute10 = ComponentAttribute.create!(
  brand: nil,
  cpuSupport: nil,
  isGPU: true,
  memorySlot: nil,
  memoryLimit: nil,
  video: false,
  memory: nil
)
component_validation1 = ComponentValidation.create!(
  componentType: "RAM",
  component_attribute: component_attribute1
)

component_validation2 = ComponentValidation.create!(
  componentType: "RAM",
  component_attribute: component_attribute2
)
component_validation3 = ComponentValidation.create!(
  componentType: "RAM",
  component_attribute: component_attribute3
)
component_validation4 = ComponentValidation.create!(
  componentType: "RAM",
  component_attribute: component_attribute4
)

component_validation5 = ComponentValidation.create!(
  componentType: "CPU",
  component_attribute: component_attribute5
)

component_validation6 = ComponentValidation.create!(
  componentType: "CPU",
  component_attribute: component_attribute6
)

component_validation7 = ComponentValidation.create!(
  componentType: "Motherboard",
  component_attribute: component_attribute7
)

component_validation8 = ComponentValidation.create!(
  componentType: "Motherboard",
  component_attribute: component_attribute8
)

component_validation9 = ComponentValidation.create!(
  componentType: "Motherboard",
  component_attribute: component_attribute9
)

component_validation10 = ComponentValidation.create!(
  componentType: "GPU",
  component_attribute: component_attribute10
)


Component.create!(
  componentName: "Kingston Hiper X",
  component_validation: component_validation1
)

Component.create!(
  componentName: "Kingston Hiper X",
  component_validation: component_validation2
)

Component.create!(
  componentName: "Kingston Hiper X",
  component_validation: component_validation3
)

Component.create!(
  componentName: "Kingston Hiper X",
  component_validation: component_validation4
)

Component.create!(
  componentName: "Core I5",
  component_validation: component_validation5
)

Component.create!(
  componentName: "Core I7",
  component_validation: component_validation5
)

Component.create!(
  componentName: "Ryzen 5",
  component_validation: component_validation6
)

Component.create!(
  componentName: "Ryzen 7",
  component_validation: component_validation6
)

Component.create!(
  componentName: "Asus ROG",
  component_validation: component_validation7
)

Component.create!(
  componentName: "Gigabyte Aorus",
  component_validation: component_validation8
)

Component.create!(
  componentName: "ASRock Steel Legend",
  component_validation: component_validation9
)

Component.create!(
  componentName: "Evga Geforce RTX 2060 6GB",
  component_validation: component_validation10
)

Component.create!(
  componentName: "Asus ROG Strix Geforce RTX 3060 6GB",
  component_validation: component_validation10
)

Component.create!(
  componentName: "Gigabyte Radeon RX 6600 XT EAGLE 8GB",
  component_validation: component_validation10
)
