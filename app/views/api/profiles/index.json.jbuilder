json.array! (@profiles) do |profile|
  json.username profile.username
  json.age profile.age
  json.summary profile.summary
end
