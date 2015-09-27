
save = (doc) -> Customers.update({_id:doc._id}, {$set: doc})
getId = -> Session.get('selectedUnitId')
  

Template.CustomersEdit.onCreated ->
  #console.log 'creating'

Template.CustomersEdit.onRendered ->
  #console.log 'rendering'

Template.CustomersEdit.onDestroyed ->
  #console.log 'destroying'


Template.CustomersEdit.helpers
  docPath: -> {id:@item._id}
  selectedId: -> getId()
  selectedUnit: ->
    id = getId()
    if not id then null else @item.units[id-1]


Template.CustomersEdit.events
  'click #unitDelete': ->
    id = getId()
    @item.units.splice(id-1,1)
    save(@item)
    Session.set 'selectedUnitId', null

  'click #unitCancel': ->
    Session.set 'selectedUnitId', null


AutoForm.hooks
  updateCustomer:
    onSuccess: (f, r) ->
      Router.go 'customers.detail', {id:@docId}
      
  updateUnit:
    onSubmit: (inDoc) ->
      this.event.preventDefault()
      id = getId()
      parent = Template.parentData(1).item
      if id
        _.extend parent.units[id-1], inDoc
      else
        parent.units.push inDoc
      save(parent)
      this.done()
