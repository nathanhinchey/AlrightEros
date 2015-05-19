json.array! (@profiles) do |profile|
  json.id profile.id
  json.username profile.username
  json.age profile.age
  json.picture_url asset_path(profile.picture.url(:thumb))
end
