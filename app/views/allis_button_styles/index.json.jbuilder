json.array!(@allis_button_styles) do |allis_button_style|
  json.extract! allis_button_style, :id, :name, :color
  json.url allis_button_style_url(allis_button_style, format: :json)
end
