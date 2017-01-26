###
# Page options, layouts, aliases and proxies
###
#ENV["snipcart-api-key"] = "API_KEY"
#ENV["base-url"] = "http://localhost:4567"

data.products.each do |p|
  proxy p.path + "/index.html", "product.html", :locals => { :product => p }, :ignore => true
end

helpers do
  def snipcart_button (p, text)
    args = {
      :"class" => "snipcart-add-item button is-primary is-medium",
      :"data-item-id" => p.id,
      :"data-item-price" => p.price,
      :"data-item-name" => p.name,
      :"data-item-max-quantity" => p.max_quantity,
      :"data-item-url" => ENV["base-url"] + p.path,
      :"data-item-image" => p.image
    }

    content_tag :button, args do
      text
    end
  end
end

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end
