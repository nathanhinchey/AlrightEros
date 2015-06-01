json.last_page @profiles.total_pages
json.profiles (@profiles) do |profile|
  json.id profile.id
  json.username profile.username
  json.age profile.age
  json.motivation profile.motivation.body
  json.picture_url asset_path(profile.picture.url(:thumb))
end
