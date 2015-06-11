json.offer do
  json.(@offer, :id, :title, :description, :active)
  json.start_at I18n.l(@offer.start_at)
  json.end_at I18n.l(@offer.end_at)
  json.photo_url @offer.photo_url(:thumb)
  json.url json.url url_for(@offer)
  json.edit_url url_for([:edit, @offer])
  json.entity_name @offer.entity_name
end
