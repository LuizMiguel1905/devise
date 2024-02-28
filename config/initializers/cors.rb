Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'

    resource '/api/components',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true
    resource '/api/component_validations',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true
    resource '/api/component_attributes',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options],
      credentials: true
  end
end
