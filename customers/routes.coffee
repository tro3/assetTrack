
Router.route '/customers',
  name:'customers.index'
  waitOn: -> [
    Meteor.subscribe 'customers'
    Meteor.subscribe 'unitTypes'
  ]
  data: ->
    items: Customers.find()


Router.route '/customers/new',
  name:'customers.insert'


Router.route '/customers/:id',
  name:'customers.detail'
  waitOn: ->
    Meteor.subscribe 'customer', @params.id
    Meteor.subscribe 'unitTypes'
  data: ->
    item: Customers.findOne({_id:@params.id})


Router.route '/customers/:id/edit',
  name:'customers.edit'
  waitOn: ->
    Meteor.subscribe 'customer', @params.id
    Meteor.subscribe 'unitTypes'
  data: ->
    item: Customers.findOne({_id:@params.id})
