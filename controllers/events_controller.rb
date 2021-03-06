# INDEX
get '/events' do
  @events = Event.all()
  erb(:'events/index')
end

# NEW
get '/events/new' do
  @sports = Sport.all()
  erb(:'events/new')
end

# CREATE
post '/events' do
  @event = Event.new(params)
  @event.save
  redirect to("/sports/#{@event.sport_id}")
end

# SHOW
get '/events/:id' do
  @event = Event.find(params['id'])
  erb(:'events/show')
end

# EDIT
get '/events/:id/edit' do
  @event = Event.find(params['id'])
  @sports = Sport.all()
  erb(:'events/edit')
end

# UPDATE
put '/events/:id' do
  event = Event.find(params['id'])
  sport = event.sport_id
  @event = Event.update(params)
  redirect to("/sports/#{sport}")
end

# DELETE
delete '/events/:id' do
  event = Event.find(params['id'])
  sport = event.sport_id
  Event.destroy(params['id'])
  redirect to("/sports/#{sport}")
end