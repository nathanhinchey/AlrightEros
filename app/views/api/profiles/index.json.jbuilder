json.array! (@profiles) do |profile|
  json.id profile.id
  json.username profile.username
  json.age profile.age
  json.summary profile.summary
end