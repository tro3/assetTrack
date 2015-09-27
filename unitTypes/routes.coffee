
Router.route '/unitTypes',
  name:'unitTypes.index'
  waitOn: -> Meteor.subscribe 'unitTypes'
  data: ->
    items: UnitTypes.find()


Router.route '/unitTypes/new',
  name:'unitTypes.insert'
    

Router.route '/unitTypes/:id',
  name:'unitTypes.detail'
  waitOn: -> Meteor.subscribe 'unitTypes', @params.id
  data: ->
    item: UnitTypes.findOne({_id:@params.id})


Router.route '/unitTypes/:id/edit',
  name:'unitTypes.edit'
  waitOn: -> Meteor.subscribe 'unitTypes', @params.id
  data: ->
    item: UnitTypes.findOne({_id:@params.id})
