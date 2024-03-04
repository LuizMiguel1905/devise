
component_attribute1 = ComponentAttribute.create!(
  componentType: 'RAM',
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 4
)

component_attribute2 = ComponentAttribute.create!(
  componentType: 'RAM',
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 8
)

component_attribute3 = ComponentAttribute.create!(
  componentType: 'RAM',
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 16
)

component_attribute4 = ComponentAttribute.create!(
  componentType: 'RAM',
  brand: nil,
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: 32
)

component_attribute5 = ComponentAttribute.create!(
  componentType: 'CPU',
  brand: 'Intel',
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: nil
)
component_attribute6 = ComponentAttribute.create!(
  componentType: 'CPU',
  brand: 'AMD',
  cpuSupport: nil,
  isGPU: nil,
  memorySlot: nil,
  memoryLimit: nil,
  video: nil,
  memory: nil
)

component_attribute7 = ComponentAttribute.create!(
  componentType: 'Motherboard',
  brand: nil,
  cpuSupport: 'Intel',
  isGPU: nil,
  memorySlot: 2,
  memoryLimit: 16,
  video: false,
  memory: nil
)

component_attribute8 = ComponentAttribute.create!(
  componentType: 'Motherboard',
  brand: nil,
  cpuSupport: 'AMD',
  isGPU: nil,
  memorySlot: 2,
  memoryLimit: 16,
  video: false,
  memory: nil
)

component_attribute9 = ComponentAttribute.create!(
  componentType: 'Motherboard',
  brand: nil,
  cpuSupport: 'BOTH',
  isGPU: nil,
  memorySlot: 4,
  memoryLimit: 64,
  video: true,
  memory: nil
)

component_attribute10 = ComponentAttribute.create!(
  componentType: 'GPU',
  brand: nil,
  cpuSupport: nil,
  isGPU: true,
  memorySlot: nil,
  memoryLimit: nil,
  video: false,
  memory: nil
)


Component.create!(
  componentName: "Kingston Hiper X 4GB",
  component_attribute: component_attribute1
)

Component.create!(
  componentName: "Kingston Hiper X 8GB",
  component_attribute: component_attribute2
)

Component.create!(
  componentName: "Kingston Hiper X 16GB",
  component_attribute: component_attribute3
)

Component.create!(
  componentName: "Kingston Hiper X 32GB",
  component_attribute: component_attribute4
)

Component.create!(
  componentName: "Core I5",
  component_attribute: component_attribute5
)

Component.create!(
  componentName: "Core I7",
  component_attribute: component_attribute5
)

Component.create!(
  componentName: "Ryzen 5",
  component_attribute: component_attribute6
)

Component.create!(
  componentName: "Ryzen 7",
  component_attribute: component_attribute6
)

Component.create!(
  componentName: "Asus ROG",
  component_attribute: component_attribute7
)

Component.create!(
  componentName: "Gigabyte Aorus",
  component_attribute: component_attribute8
)

Component.create!(
  componentName: "ASRock Steel Legend",
  component_attribute: component_attribute9
)

Component.create!(
  componentName: "Evga Geforce RTX 2060 6GB",
  component_attribute: component_attribute10
)

Component.create!(
  componentName: "Asus ROG Strix Geforce RTX 3060 6GB",
  component_attribute: component_attribute10
)

Component.create!(
  componentName: "Gigabyte Radeon RX 6600 XT EAGLE 8GB",
  component_attribute: component_attribute10
)
