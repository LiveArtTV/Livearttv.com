if @taxon
  json.array! @taxon.products.map {|p| {id: p.id, name: p.name}}
elsif @products
  json.array! @products.map {|p| {id: p.id, name: p.name}}
end