json.milestones do
  json.array! @milestones do |milestone|
    json.id milestone.id
    json.title milestone.title
    json.date milestone.date
    json.story milestone.story
    json.user_name milestone.user.username
  end
end