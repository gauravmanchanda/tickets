Time::DATE_FORMATS.merge!(
  :custom => lambda { |date| date.strftime("%Y-%m-%d %H:%M:%S") }
)