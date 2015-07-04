json.array!(@allis_buttons) do |allis_button|
  json.extract! allis_button, :id, :user_id, :word, :start_date, :udate_date, :interval, :subject_warning, :message_warning, :eml_warning, :warns
  json.url allis_button_url(allis_button, format: :json)
end
